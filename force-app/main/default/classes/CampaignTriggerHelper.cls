public class CampaignTriggerHelper {
    public void campanhaInsert(Campaign campanha) {
        if (campanha.Type == 'Trade Show' && campanha.ExpectedResponse <= 80) {
            campanha.ExpectedResponse = 80;
        }
        if (campanha.Type == 'Webinar') {
            boolean data = campanha.EndDate < date.today();
            if (data == true) {
                campanha.Status = 'Completed';
            }
        }
    }
    public void campanhaUpdate(Campaign campanha) {
        if (campanha.IsActive == false) {
            campanha.IsActive = true;
        }
        if (campanha.ExpectedRevenue > 0) {
            campanha.ExpectedRevenue *= 10;
        }
    }
}