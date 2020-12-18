public class Cafeteira {
	private decimal valorCofre = 20;
    public decimal saldoDisponivel = 0;
    public string insumo = 'Cafe';
    public integer insumoNum = 5;
    public decimal insumoPreco = 5;
   
    public void depositar(decimal valorDep) {
        this.valorCofre += valorDep;
        this.saldoDisponivel += valorDep;
    }
    
    public decimal getValorCofre() {
        return this.valorCofre;
    }
    
    public void escolherBebida() {
        if(this.insumo == 'Cafe' && this.insumoNum > 0) {
            this.insumoNum = this.insumoNum - 1;
        }
        if(this.insumo == 'Cappuccino' && this.insumoNum > 0 && this.saldoDisponivel >= 0.5) {
            this.insumoNum = this.insumoNum - 1;
            this.saldoDisponivel = this.saldoDisponivel - 0.5;
        } 
        if(this.insumo == 'Chocolate' && this.insumoNum > 0 && this.saldoDisponivel >= 1) {
            this.insumoNum = this.insumoNum - 1;
            this.saldoDisponivel = this.saldoDisponivel - 1;
        } 
        
    }
}