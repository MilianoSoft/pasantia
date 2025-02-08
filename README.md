# BASE DE DATOS PARA UN SISTEMA DE GESTION DE PASANTIAS EN LA  UNIVERSIDAD

RELACIONES ENTRE LAS TABLAS DEL SISTEMA

Universidad y Recinto:
Una universidad puede tener varios recintos, pero cada recinto pertenece a una única universidad. Esto se representa mediante la relación entre las tablas Universidad y Recinto utilizando la llave foránea UniversidadID en la tabla Recinto.

Carrera y CarreraRecinto:
Una carrera puede ofrecerse en varios recintos, y un recinto puede ofrecer varias carreras. Para representar esta relación muchos a muchos, se utiliza la tabla intermedia CarreraRecinto que contiene las llaves foráneas CarreraID y RecintoID para relacionar las tablas Carrera y Recinto.

Recinto y Estudiante:
Un recinto puede tener varios estudiantes, y cada estudiante pertenece a un único recinto. Esto se representa mediante la llave foránea RecintoID en la tabla Estudiante.

Carrera y Estudiante:
Un estudiante cursa una carrera, y una carrera puede ser cursada por varios estudiantes. Esta relación se establece mediante la llave foránea CarreraID en la tabla Estudiante.

Empresa y Pasantia:
Una empresa puede tener varias pasantías, pero cada pasantía pertenece a una única empresa. Esto se representa utilizando la llave foránea EmpresaID en la tabla Pasantia.

Carrera y Pasantia:
Una pasantía está relacionada con una carrera específica. Esto se representa mediante la llave foránea CarreraID en la tabla Pasantia.

Estudiante y Pasantia:
Un estudiante puede solicitar varias pasantías, y cada pasantía puede ser solicitada por varios estudiantes. La relación entre estudiante y pasantía se establece a través de la tabla SolicitudPasantia, que contiene las llaves foráneas EstudianteID y PasantiaID.

Pasantia y SolicitudPasantia:
Cada solicitud de pasantía está relacionada con una pasantía específica. Esto se representa mediante la llave foránea PasantiaID en la tabla SolicitudPasantia.

Empresa y SolicitudPasantia:
En la tabla SolicitudPasantia, se almacena una empresa sugerida para la pasantía. Esto se representa mediante la llave foránea EmpresaSugeridaID que apunta a la tabla Empresa.

Usuario y Universidad:
Cada usuario está asociado a una universidad, y una universidad puede tener varios usuarios. La relación entre usuario y universidad se establece mediante la llave foránea UniversidadID en la tabla Usuario.

Usuario y Rol 
se establece mediante una llave foránea en la tabla Usuario que hace referencia al ID del rol en la tabla Rol. Esto permite vincular cada usuario a un rol específico.
En este ejemplo, el campo RolID en la tabla Usuario se utiliza como una llave foránea que hace referencia al campo ID en la tabla Rol. Esto significa que cada usuario en la tabla Usuario estará asociado con un rol específico de la tabla Rol.
Por ejemplo, si tienes un rol llamado "Estudiante" en la tabla Rol con un ID de 1, y un usuario con RolID de 1 en la tabla Usuario, entonces ese usuario está asociado con el rol "Estudiante"


TABLA DE ACTIVIDADES O LOGS 

puedes almacenar información sobre las acciones realizadas por los usuarios en el sistema. Los campos clave son:
ID: Un identificador único para cada registro de actividad.
UsuarioID: La llave foránea que relaciona el registro de actividad con el usuario que realizó la acción.
FechaHora: La fecha y hora en que se realizó la actividad.
Actividad: Un campo de texto que almacena detalles sobre la actividad realizada por el usuario.
Cuando un usuario realiza una acción en el sistema, puedes insertar un nuevo registro en la tabla Logs con los detalles de la actividad. Esto puede ayudar a realizar un seguimiento de las actividades realizadas por los usuarios y a solucionar problemas o analizar el comportamiento en el sistema.


COMO GESTIONAR LAS PASANTIAS Y SOLICITUD DE PASANTIAS

El campo "Estado" en las tablas SolicitudPasantia y Pasantia es un campo que indica el estado actual de una solicitud de pasantía o de una pasantía en particular. 
Este campo es útil para llevar un registro del proceso y la evolución de cada solicitud y pasantía a medida que avanzan a través de diferentes etapas.

En la tabla SolicitudPasantia se puede manejar el campo estado con los siguientes status:

Pendiente: La solicitud ha sido enviada por el estudiante pero aún no ha sido revisada por la universidad.
Aprobada: La solicitud ha sido revisada y aprobada por la universidad.
Rechazada: La solicitud ha sido revisada y rechazada por la universidad.

En la tabla Pasantia se puede manejar el campo estado con los siguientes status:

Planificada: La pasantía está programada para comenzar en el futuro.
En Progreso: La pasantía está actualmente en curso.
Finalizada: La pasantía ha sido completada exitosamente.
Cancelada: La pasantía ha sido cancelada por alguna razón.

Cada vez que cambias el estado de una solicitud de pasantía o una pasantía, actualizas el valor del campo "Estado" en la base de datos para reflejar el nuevo estado. Esto te permite mantener un seguimiento claro del estado actual de cada elemento y tomar decisiones basadas en esos estados (por ejemplo, enviar notificaciones automáticas cuando una solicitud es aprobada o cuando una pasantía se cancela)
