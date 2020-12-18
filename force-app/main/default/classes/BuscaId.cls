public class BuscaId {
    public void buscaObjeto(Id idObjeto) {
        Schema.SObjectType tipoObjeto = idObjeto.getSObjectType();
        String nomeObjeto = tipoObjeto.getDescribe().getName();
        SObject resultado = Database.query('Select Id, Name From ' + nomeObjeto + ' Where Id = :idObjeto');
        System.debug('Id: ' + idObjeto + '; Tipo objeto: ' + nomeObjeto);
    }
}