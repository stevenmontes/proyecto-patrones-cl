
CREATE TABLE [dbo].[tarea_funcional](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_area_funcional] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_codigo_area_funcional] UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[templeado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](20) NOT NULL,
	[primer_nombre] [varchar](50) NOT NULL,
	[segundo_nombre] [varchar](50) NULL,
	[primer_apellido] [varchar](50) NOT NULL,
	[segundo_apellido] [varchar](50) NULL,
	[correo] [varchar](50) NOT NULL,
	[usuario] [varchar](25) NOT NULL,
	[clave] [varchar](25) NOT NULL,
	[rol] [varchar](50) NOT NULL,
	[id_area_funcional] [int] NOT NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tfirma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[firma] [varchar](300) NOT NULL,
	[llave] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tpaso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[estado] [varchar](15) NOT NULL,
	[id_tarea] [int] NOT NULL,
	[id_empleado] [int] NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[nombre] [varchar](50) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[respuesta] [char](1) NOT NULL,
	[numero_orden] [int] NOT NULL,
 CONSTRAINT [PK_paso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tpasos_x_empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
	[duracion] [time](7) NULL,
	[id_paso] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
 CONSTRAINT [PK_pasos_x_empleados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tproceso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[estado] [varchar](15) NOT NULL,
	[firma] [varchar](100) NULL,
 CONSTRAINT [PK_proceso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_codigo_proceso] UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ttarea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[estado] [varchar](15) NOT NULL,
	[id_proceso] [int] NOT NULL,
	[id_area_funcional] [int] NOT NULL,
	[numero_orden] [int] NOT NULL,
 CONSTRAINT [PK_tarea] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_codigo_tarea] UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tpaso] ADD  CONSTRAINT [DF_estado_paso]  DEFAULT ('Inactivo') FOR [estado]
GO
ALTER TABLE [dbo].[tpaso] ADD  CONSTRAINT [DF_fecha_inicio_paso]  DEFAULT ('1998/01/01') FOR [fecha_inicio]
GO
ALTER TABLE [dbo].[tpaso] ADD  CONSTRAINT [DF_fecha_fin_paso]  DEFAULT ('1998/01/01') FOR [fecha_fin]
GO
ALTER TABLE [dbo].[tpaso] ADD  CONSTRAINT [DF_nombre_paso]  DEFAULT ('') FOR [nombre]
GO
ALTER TABLE [dbo].[tpaso] ADD  CONSTRAINT [DF_codigo_paso]  DEFAULT ('') FOR [codigo]
GO
ALTER TABLE [dbo].[tpaso] ADD  CONSTRAINT [DF_respuesta_paso]  DEFAULT ('f') FOR [respuesta]
GO
ALTER TABLE [dbo].[tpaso] ADD  CONSTRAINT [DF_numero_orden]  DEFAULT ((-1)) FOR [numero_orden]
GO
ALTER TABLE [dbo].[tpasos_x_empleados] ADD  CONSTRAINT [DF_fecha_inicio_tipe]  DEFAULT ('1998/01/01') FOR [fecha_inicio]
GO
ALTER TABLE [dbo].[tpasos_x_empleados] ADD  CONSTRAINT [DF_fecha_fin_tipe]  DEFAULT ('1998/01/01') FOR [fecha_fin]
GO
ALTER TABLE [dbo].[tproceso] ADD  CONSTRAINT [DF_fecha_inicio_proceso]  DEFAULT ('1/01/01') FOR [fecha_inicio]
GO
ALTER TABLE [dbo].[tproceso] ADD  CONSTRAINT [DF_fecha_fin_proceso]  DEFAULT ('1998/01/01') FOR [fecha_fin]
GO
ALTER TABLE [dbo].[tproceso] ADD  CONSTRAINT [DF_estado_proceso]  DEFAULT ('Inactivo') FOR [estado]
GO
ALTER TABLE [dbo].[ttarea] ADD  CONSTRAINT [DF_estado_tarea]  DEFAULT ('Inactivo') FOR [estado]
GO
ALTER TABLE [dbo].[ttarea] ADD  CONSTRAINT [DF_numero_orden_tarea]  DEFAULT ((0)) FOR [numero_orden]
GO
ALTER TABLE [dbo].[templeado]  WITH CHECK ADD  CONSTRAINT [FK_area_empleado] FOREIGN KEY([id_area_funcional])
REFERENCES [dbo].[tarea_funcional] ([id])
GO
ALTER TABLE [dbo].[templeado] CHECK CONSTRAINT [FK_area_empleado]
GO
ALTER TABLE [dbo].[tfirma]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[templeado] ([id])
GO
ALTER TABLE [dbo].[tpaso]  WITH CHECK ADD  CONSTRAINT [FK_empleado_paso] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[templeado] ([id])
GO
ALTER TABLE [dbo].[tpaso] CHECK CONSTRAINT [FK_empleado_paso]
GO
ALTER TABLE [dbo].[tpaso]  WITH CHECK ADD  CONSTRAINT [FK_tarea_paso] FOREIGN KEY([id_tarea])
REFERENCES [dbo].[ttarea] ([id])
GO
ALTER TABLE [dbo].[tpaso] CHECK CONSTRAINT [FK_tarea_paso]
GO
ALTER TABLE [dbo].[tpasos_x_empleados]  WITH CHECK ADD  CONSTRAINT [FK_empleado_tipe] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[templeado] ([id])
GO
ALTER TABLE [dbo].[tpasos_x_empleados] CHECK CONSTRAINT [FK_empleado_tipe]
GO
ALTER TABLE [dbo].[tpasos_x_empleados]  WITH CHECK ADD  CONSTRAINT [FK_paso_tipe] FOREIGN KEY([id_paso])
REFERENCES [dbo].[tpaso] ([id])
GO
ALTER TABLE [dbo].[tpasos_x_empleados] CHECK CONSTRAINT [FK_paso_tipe]
GO
ALTER TABLE [dbo].[ttarea]  WITH CHECK ADD  CONSTRAINT [FK_area_tarea] FOREIGN KEY([id_area_funcional])
REFERENCES [dbo].[tarea_funcional] ([id])
GO
ALTER TABLE [dbo].[ttarea] CHECK CONSTRAINT [FK_area_tarea]
GO
ALTER TABLE [dbo].[ttarea]  WITH CHECK ADD  CONSTRAINT [FK_proceso_tarea] FOREIGN KEY([id_proceso])
REFERENCES [dbo].[tproceso] ([id])
GO
ALTER TABLE [dbo].[ttarea] CHECK CONSTRAINT [FK_proceso_tarea]
GO
ALTER TABLE [dbo].[tpaso]  WITH CHECK ADD  CONSTRAINT [CHK_estado_paso] CHECK  (([estado]='Completado' OR [estado]='En proceso' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[tpaso] CHECK CONSTRAINT [CHK_estado_paso]
GO
ALTER TABLE [dbo].[tproceso]  WITH CHECK ADD  CONSTRAINT [CHK_estado_proceso] CHECK  (([estado]='Completado' OR [estado]='En proceso' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[tproceso] CHECK CONSTRAINT [CHK_estado_proceso]
GO
ALTER TABLE [dbo].[ttarea]  WITH CHECK ADD  CONSTRAINT [CHK_estado_tarea] CHECK  (([estado]='Completado' OR [estado]='En proceso' OR [estado]='Inactivo'))
GO
ALTER TABLE [dbo].[ttarea] CHECK CONSTRAINT [CHK_estado_tarea]

create procedure [dbo].[listarFirmas]
as
select * from tfirma

CREATE PROCEDURE [dbo].[pa_iniciar_sesion] 
@usuario VARCHAR(25),
@clave VARCHAR(25)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT cedula, primer_nombre, primer_apellido, id_area_funcional 
			FROM templeado 
			WHERE @usuario = usuario
			AND @clave = clave
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	END CATCH
GO

	CREATE PROCEDURE [dbo].[pa_listar_areas]
	AS
	SELECT * 
	FROM tarea_funcional

SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_listar_areas_funcionales]
	AS
	SELECT codigo, nombre, descripcion,estado
	FROM tarea_funcional

	CREATE PROCEDURE [dbo].[pa_listar_empleados]
	AS
	SELECT e.cedula, e.primer_nombre, e.segundo_nombre, e.primer_apellido, e.segundo_apellido, e.correo, e.usuario, e.clave, e.rol, a.nombre
	FROM templeado AS e
	INNER JOIN tarea_funcional AS a
	ON e.id_area_funcional = a.id

CREATE PROCEDURE [dbo].[pa_listar_pasos]
	@codigo_tarea VARCHAR(50)
	AS
	DECLARE @id_tarea INT

	SELECT @id_tarea = id
	FROM ttarea
	WHERE codigo = @codigo_tarea

	SELECT p.id, p.codigo, p.nombre, p.descripcion, p.fecha_inicio, p.fecha_fin, p.estado, p.numero_orden
	FROM tpaso
	AS p 
	WHERE p.id_tarea = @id_tarea
GO

CREATE PROCEDURE [dbo].[pa_listar_procesos]
AS
SELECT codigo, nombre, fecha_inicio, fecha_fin, descripcion, estado
FROM tproceso
GO

CREATE PROCEDURE [dbo].[pa_listar_tareas]
	@codigo_proceso VARCHAR(50)
	AS
	DECLARE @id_proceso INT

	SELECT @id_proceso = id
	FROM tproceso
	WHERE codigo = @codigo_proceso

	SELECT t.codigo, t.nombre, t.descripcion, t.estado,a.codigo as codA, a.nombre as area,a.descripcion as desA, t.numero_orden
	FROM ttarea AS t
	INNER JOIN tarea_funcional AS a
	ON t.id_area_funcional = a.id
	WHERE t.id_proceso = @id_proceso

  create procedure [dbo].[pa_listarProcesosActivos]
	as
	select * from tproceso where estado='En proceso'
	
	
GO

	create procedure [dbo].[pa_listarProcesosCompleto]
	as
	select * from tproceso where estado='Completado'

CREATE PROCEDURE [dbo].[pa_modificar_departamento]
	@nombre VARCHAR(50),
	@codigo VARCHAR(50),
	@descripcion VARCHAR(300)
	AS
		UPDATE tarea_funcional
		SET nombre = @nombre,
				descripcion = @descripcion
		WHERE codigo = @codigo
GO

CREATE PROCEDURE [dbo].[pa_modificar_empleado]
	@cedula VARCHAR(20),
	@nom1 VARCHAR(50),
	@nom2 VARCHAR(50),
	@ape1 VARCHAR(50),
	@ape2 VARCHAR(50),
	@correo VARCHAR(50),
	@nomU VARCHAR(25),
	@clave VARCHAR(25),
	@rol VARCHAR(50),
	@codigo_area VARCHAR(50)
	AS
		DECLARE @id_area INT

		SELECT @id_area = id
		FROM tarea_funcional
		WHERE @codigo_area = codigo
	
		UPDATE templeado
		SET primer_nombre = @nom1,
				segundo_nombre = @nom2,
				primer_apellido = @ape1,
				segundo_apellido = @ape2,
				correo = @correo,
				usuario = @nomU,
				clave = @clave,
				rol = @rol,
				id_area_funcional = @id_area
		WHERE cedula = @cedula
GO

CREATE PROCEDURE [dbo].[pa_modificar_paso]
	@codigo VARCHAR(50),
	@nombre VARCHAR(50),
	@descripcion VARCHAR(300)
	AS
		UPDATE tpaso
		SET nombre  = @nombre,
				descripcion = @descripcion
		WHERE codigo = @codigo
GO

 CREATE PROCEDURE [dbo].[pa_modificar_paso_completo]
	@codigo_paso VARCHAR(50),
	@estado VARCHAR(15),
	@respuesta CHAR(1),
	@fecha_inicio DATE,
	@fecha_fin DATE,
	@cedula VARCHAR(20)
	AS

	DECLARE @id_encargado INT
	SELECT @id_encargado = id
	FROM templeado
	WHERE @cedula = cedula

	UPDATE tpaso
	SET estado = @estado,
			respuesta = @respuesta,
			fecha_inicio = @fecha_inicio,
			fecha_fin = @fecha_fin,
			id_empleado = @id_encargado
	WHERE @codigo_paso = codigo
GO

CREATE PROCEDURE [dbo].[pa_modificar_proceso]
	@codigo VARCHAR(50),
	@nombre VARCHAR(50),
	@descripcion VARCHAR(300)
	AS
	UPDATE tproceso
	SET nombre = @nombre,
			descripcion = @descripcion
	WHERE codigo = @codigo
GO

CREATE PROCEDURE [dbo].[pa_modificar_tarea]
	@codigo VARCHAR(50),
	@nombre VARCHAR(50),
	@descripcion VARCHAR(300),
	@codigo_area VARCHAR(50)
	AS
	DECLARE @id_area_funcional INT

	SELECT @id_area_funcional = id 
	FROM tarea_funcional
	WHERE codigo = @codigo_area

	UPDATE ttarea
	SET nombre = @nombre,
			descripcion = @descripcion,
			id_area_funcional = @id_area_funcional
	WHERE codigo = @codigo
GO

CREATE procedure [dbo].[pa_modificarEstadoTramite]
@codigo varchar(50),
@firma varchar(100)
as
declare @id int
select @id=id
from tproceso
where firma=@firma

update tproceso
set estado='En proceso',
firma=@id
where codigo=@codigo
GO

CREATE PROCEDURE [dbo].[pa_obtener_cedulas_empleados]
AS
SELECT cedula FROM templeado
GO

CREATE PROCEDURE [dbo].[pa_obtener_codigo_tarea_por_area]
	@id_area_funcional INT
	AS
	SELECT codigo
	FROM ttarea
	WHERE id_area_funcional = @id_area_funcional
GO

CREATE PROCEDURE [dbo].[pa_obtener_codigos_area_funcional]
AS
SELECT codigo FROM tarea_funcional
GO

CREATE PROCEDURE [dbo].[pa_obtener_codigos_pasos]
AS
SELECT codigo FROM tpaso
GO

CREATE PROCEDURE [dbo].[pa_obtener_codigos_procesos]
AS
SELECT codigo FROM tproceso
GO

CREATE PROCEDURE [dbo].[pa_obtener_codigos_tareas]
AS
SELECT codigo FROM ttarea
GO

CREATE PROCEDURE [dbo].[pa_obtener_id_tarea]
	@id_area_funcional INT
	AS 
	SELECT id
	FROM ttarea
	WHERE id_area_funcional = @id_area_funcional
GO

CREATE PROCEDURE [dbo].[pa_obtener_paso]
	@id_tarea INT
	AS 
	SELECT p.id, p.codigo, p.nombre, p.descripcion, p.respuesta, p.estado, p.fecha_inicio, p.fecha_fin  
	FROM tpaso AS p
	WHERE id_tarea = @id_tarea
GO

CREATE PROCEDURE [dbo].[pa_obtener_tareas_por_area]
	@id_area_funciona INT
	AS
	SELECT t.codigo, t.nombre, t.descripcion, t.estado, t.numero_orden 
	FROM ttarea
	AS t
	WHERE t.id_area_funcional = @id_area_funciona
GO

CREATE PROCEDURE [dbo].[pa_registrar_departamento]
	@nombre VARCHAR(50),
	@codigo VARCHAR(50),
	@descripcion VARCHAR(300)
	AS
		INSERT INTO tarea_funcional (nombre, codigo, descripcion,estado)
		VALUES (@nombre, @codigo, @descripcion,'Activo')
GO

CREATE PROCEDURE [dbo].[pa_registrar_empleado]
	@cedula VARCHAR(20),
	@nom1 VARCHAR(50),
	@nom2 VARCHAR(50),
	@ape1 VARCHAR(50),
	@ape2 VARCHAR(50),
	@correo VARCHAR(50),
	@nomU VARCHAR(25),
	@clave VARCHAR(25),
	@rol VARCHAR(50),
	@codigo_area VARCHAR(50)
	AS
		DECLARE @id_area INT

		SELECT @id_area = id
		FROM tarea_funcional
		WHERE @codigo_area = codigo

		INSERT INTO templeado (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 
													  correo, usuario, clave, rol, id_area_funcional)
		VALUES (@cedula, @nom1, @nom2, @ape1, @ape2, @correo, @nomU, @clave, @rol, @id_area)
GO

CREATE PROCEDURE [dbo].[pa_registrar_estado_tarea]
	@codigo VARCHAR(50),
	@estado VARCHAR(15)
	AS
	UPDATE ttarea
	SET estado = @estado
	WHERE codigo = @codigo
GO

CREATE procedure [dbo].[pa_registrar_firma]
@cedula varchar(50),
@firma varchar(300),
@key varchar  (50)
as
declare @id int 
select @id=id
from templeado
where cedula=@cedula

insert into tfirma(idEmpleado,firma,llave,nombre)
values(@id,@firma,@key,@cedula)
GO

CREATE PROCEDURE [dbo].[pa_registrar_paso]
	 @codigo VARCHAR(50),
	@nombre VARCHAR(50),
	@descripcion VARCHAR(300),
	@codigo_tarea VARCHAR(50),
	@numero_orden INT
	AS
		DECLARE @id_tarea INT

		SELECT @id_tarea = id 
		FROM ttarea
		WHERE codigo = @codigo_tarea

		INSERT INTO tpaso (codigo, nombre, descripcion, id_tarea, numero_orden)
		VALUES (@codigo, @nombre, @descripcion, @id_tarea, @numero_orden)
GO

CREATE PROCEDURE [dbo].[pa_registrar_proceso]
@codigo VARCHAR(50),
@nombre VARCHAR(50),
@descripcion VARCHAR(300),
@firma varchar(100)
AS


INSERT INTO tproceso (codigo, nombre, descripcion,fecha_inicio,firma)
VALUES (@codigo, @nombre, @descripcion,GETDATE(),@firma)

CREATE PROCEDURE [dbo].[pa_registrar_tarea]
	@codigo VARCHAR(50),
	@nombre VARCHAR(50),
	@descripcion VARCHAR(300),
	@codigo_area VARCHAR(50),
	@codigo_proceso VARCHAR(50),
	@numero_orden INT
	AS
		DECLARE @id_area_funcional INT
		DECLARE @id_proceso INT

		SELECT @id_area_funcional = id 
		FROM tarea_funcional 
		WHERE codigo = @codigo_area

		SELECT @id_proceso = id
		FROM tproceso
		WHERE codigo = @codigo_proceso

		INSERT INTO ttarea (codigo, nombre, descripcion, id_area_funcional, id_proceso, numero_orden)
		VALUES (@codigo, @nombre, @descripcion, @id_area_funcional, @id_proceso, @numero_orden)

ALTER DATABASE [bd_sistema_patrones_v1] SET  READ_WRITE 
GO
