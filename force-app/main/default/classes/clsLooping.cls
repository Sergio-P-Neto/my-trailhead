public class clsLooping {
    public void loopMap(integer repeticoes) {
        Map<String, List<Integer>> mapRegistros = new Map<String, List<Integer>>();
        List<integer> numRegistros = new List<integer>();
        repeticoes += 2;
        for (integer i = 1; i < repeticoes; i++) {
            repeticoes -= 1;
            List<integer> lsNum = new List<integer>();
            for (integer j = 1; j < repeticoes; j++) {
                lsNum.add(repeticoes);
                repeticoes++;
            }
            mapRegistros.put('Registro ' + i, lsNum);
            for (String mapRegistros2 : mapRegistros.keyset()) {
                system.debug('############################');
                system.debug(mapRegistros2 + ' - ' + lsNum);
            }
        }
    }
    public void loopMap2(integer repeticoes) {
        Map<String, List<Integer>> mapRegistros = new Map<String, List<Integer>>();
        List<integer> numRegistros = new List<integer>();
        repeticoes += 1;
        for (integer i = 1; i < repeticoes; i++) {
            List<integer> lsNum = new List<integer>();
            for (integer j = 1; j < repeticoes; j++) {
                lsNum.add(j);
            }
            mapRegistros.put('Registro ' + i, lsNum);
            for (String mapRegistros2 : mapRegistros.keyset()) {
                system.debug('############################');
                system.debug(mapRegistros2 + ' - ' + lsNum);
            }
        }
    }
}