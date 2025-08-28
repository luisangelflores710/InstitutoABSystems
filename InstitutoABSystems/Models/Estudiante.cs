using System;
using System.ComponentModel.DataAnnotations;

namespace InstitutoABSystems.Models
{
    public class Estudiante
    {
        public int Id { get; set; }
        public int IdUsuario { get; set; }

        [Required(ErrorMessage = "El campo Nombres es obligatorio")]
        public string Nombres { get; set; }

        [Required(ErrorMessage = "El campo Apellidos es obligatorio")]
        public string Apellidos { get; set; }

        [Required(ErrorMessage = "La Fecha de Nacimiento es obligatoria")]
        public DateTime FechaNacimiento { get; set; }

        [Required(ErrorMessage = "La Dirección es obligatoria")]
        public string Direccion { get; set; }

        [Required(ErrorMessage = "El Sexo es obligatorio")]
        public string Sexo { get; set; }

        [Required(ErrorMessage = "El CURP es obligatorio")]
        public string CURP { get; set; }

        [Required(ErrorMessage = "El Teléfono es obligatorio")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "El Email es obligatorio")]
        [EmailAddress(ErrorMessage = "Ingrese un correo válido")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Debe seleccionar modalidad")]
        public string Modalidad { get; set; } // Presencial u Online

        [Required(ErrorMessage = "Debe indicar si requiere asistencia")]
        public bool RequiereAsistencia { get; set; }

        // Opcionales
        public string DescripcionPersonal { get; set; }

        // Para varios exámenes
        public bool VariosExamenesBool { get; set; }
        public string VariosExamenes { get; set; }

        public string HorarioPreferencia { get; set; }
    }
}
