public with sharing class Utils {
    
    private static final map<Long, String> unidades = new map<Long, String>{
        0 => '', 1 => 'Um', 2 => 'Dois', 3 => 'Três', 4 => 'Quatro',
        5 => 'Cinco', 6 => 'Seis', 7 => 'Sete', 8 => 'Oito', 9 => 'Nove', 10 => 'Dez',
        11 => 'Onze', 12 => 'Doze', 13 => 'Treze', 14 => 'Quatorze', 15 => 'Quinze',
        16 => 'Dezesseis', 17 => 'Dezesete', 18 => 'Dezoito', 19 => 'Dezenove'
        };
                
    private static final map<Long, String> dezenas = new map<Long, String>{
        2 => 'Vinte', 3 => 'Trinta', 4 => 'Quarenta', 5 => 'Cinquenta',
        6 => 'Sessenta', 7 => 'Setenta', 8 => 'Oitenta', 9 => 'Noventa'
      };
                            
    private static final map<Long, String> centenas = new map<Long, String>{
        1 => 'Cento', 2 => 'Duzentos', 3 => 'Trezentos', 4 => 'Quatrocentos', 5 => 'Quinhentos',
        6 => 'Seiscentos', 7 => 'Setecentos', 8 => 'Oitocentos', 9 => 'Novecentos'
    };
                                        
    private static final map<Long, String> descPlural = new map<Long, String>{
        0 => '', 1 => ' mil' , 2 => ' milhões' , 3 => ' bilhões',
        4 => ' trilhões', 5 => ' quatrilhões'
    };
                                                    
    private static final map<Long, String> descSingular = new map<Long, String>{
        0 => '', 1 => ' mil' , 2 => ' milhão' , 3 => ' bilhão',
        4 => ' trilhão', 5 => ' quatrilhão'
    };
                                                                
    private static String getMilhar(Long i) {
        if(i < 20)  return unidades.get(i);
        if(i < 100) return dezenas.get(i/10) + ((Math.mod(i, 10) > 0)? ' e ' + getMilhar(Math.mod(i, 10)) : '');
        return (i/100 == 1 && (Math.mod(i, 100) == 0)) ? 'Cem' : ( centenas.get(i/100) + ((Math.mod(i, 100) > 0) ? ' e ' + getMilhar(Math.mod(i, 100)) : ''));
    }
    
    private static String conector(Integer aValue) {
        if (aValue == 0) return '';
        if (aValue < 100 || Math.mod(aValue, 100) == 0) return ' e ';
        else return ', ';
    }
    
    private static String getClasse(Integer aValue, Integer aClass) {
        if (aValue == 0) return '';
        if (aValue == 1) return descSingular.get(aClass);
        else return descPlural.get(aClass) ;
    }
    
    private static String getWrittenForm(Long aValue) {
        
      List<Integer> lListClasses = new List<Integer>();
        for (Integer i = 0; aValue > 0; i++) {
            lListClasses.add(Math.mod(aValue, 1000).intValue());
            aValue = aValue / 1000;
        }
        
        String lResult = '';
        Integer lSize = lListClasses.size();

        for (Integer i = 0; i < lSize; i++) {
            lResult = getMilhar(lListClasses[i])
                + getClasse( lListClasses[i], i)
                + (i > 0 ? conector(lListClasses[i - 1] ) : '')
                + lResult;
        }
        return lResult;
    }
    
    public static String separateByDot(Decimal value) {
        String writtenResult = '';
        
        if (value != null) {
            String num = String.valueOf(value);
            System.debug(num);
            
            List<String> parts = num.split('\\.');
            System.debug(parts);
            
            Long res = long.valueOf(parts[0]);
            System.debug(res);
            if (res == 0) {
                writtenResult = 'Zero real(is)';
            } else {
                writtenResult = getWrittenForm(res) + ' real(is)';
            }
            
            if (parts.size() > 1) {
                if (parts[1] != '0') {
                    Long res2 = long.valueOf(parts[1]);
                    writtenResult += ' e ' + getWrittenForm(res2) + ' centavo(s).';
                }
            }
        }
        return writtenResult;
    }
}