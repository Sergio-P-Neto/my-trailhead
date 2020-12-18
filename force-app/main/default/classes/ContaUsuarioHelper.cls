public class ContaUsuarioHelper {
    public void criaTarefa(List<Chamado__c> lsChamados) {
        List<Task> lsTarefas = new List<Task>();
        for (Chamado__c chamado : lsChamados) {
            if (chamado.Conta__c != NULL && chamado.Usuario__c != NULL) {
                Task tarefa = new Task();
                tarefa.OwnerId = chamado.Usuario__c;
                tarefa.WhatId = chamado.Conta__c;
                tarefa.Subject = 'Verificar Chamado ' + chamado.Name;
                tarefa.Status = 'Not Started';
                if (chamado.DataHora_Inicio__c != NULL) {
                    datetime dataInicio = chamado.DataHora_Inicio__c;
                    integer dia = dataInicio.day() + 3;
                    integer mes = dataInicio.month();
                    integer ano = dataInicio.year();
                    tarefa.ActivityDate = date.newInstance(ano, mes, dia);
                }
                lsTarefas.add(tarefa);
            }
        }
        insert lsTarefas;
    }
}