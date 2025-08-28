using System;

namespace InstitutoABSystems.Models
{
    public class Inscrip
    {
        public int Id { get; set; }
        public int IdUsuario { get; set; }
 
        public int IdExamen { get; set; }
        public DateTime FechaExamen { get; set; }
        public TimeSpan HoraExamen { get; set; }
        public string CodigoParticipacion { get; set; }
        public string Estado { get; set; } // Inscrito / Presentado / Cancelado
    }
}
