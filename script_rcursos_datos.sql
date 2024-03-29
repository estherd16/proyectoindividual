USE [bd_ger2]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 19/08/2019 1:24:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Comentarios](
	[idcomentario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[correo] [varchar](80) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[mensaje] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcomentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cuentas](
	[idcuenta] [int] IDENTITY(1,1) NOT NULL,
	[nombreuser] [varchar](30) NULL,
	[clave] [varchar](30) NULL,
	[rol] [varchar](30) NULL,
	[idusuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recursos]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recursos](
	[idrecursos] [int] IDENTITY(1,1) NOT NULL,
	[nombrer] [varchar](50) NULL,
	[codigo] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idrecursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Solicitud](
	[idsolicitud] [int] IDENTITY(1,1) NOT NULL,
	[aula] [varchar](10) NULL,
	[nivel] [varchar](4) NULL,
	[fechasolicitud] [date] NULL DEFAULT (getdate()),
	[fechauso] [date] NULL,
	[horainicio] [time](7) NULL,
	[horafinal] [time](7) NULL,
	[carrera] [varchar](max) NULL,
	[asignatura] [varchar](max) NULL,
	[idrecursos] [int] NULL,
	[idusuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idsolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](14) NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[telefono] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Recursos] ON 

INSERT [dbo].[Recursos] ([idrecursos], [nombrer], [codigo], [descripcion]) VALUES (4, N'Televisor #2', N'3434', N'En mal estado')
INSERT [dbo].[Recursos] ([idrecursos], [nombrer], [codigo], [descripcion]) VALUES (5, N'Datashow', N'6767', N'Buen estado')
INSERT [dbo].[Recursos] ([idrecursos], [nombrer], [codigo], [descripcion]) VALUES (6, N'PC escritorio', N'1343', N'Marca HP')
INSERT [dbo].[Recursos] ([idrecursos], [nombrer], [codigo], [descripcion]) VALUES (7, N'Recurso 1', N'2323', N'Computador #1')
INSERT [dbo].[Recursos] ([idrecursos], [nombrer], [codigo], [descripcion]) VALUES (9, N'PC #4', N'5509', N'Marca HP, buen estado')
SET IDENTITY_INSERT [dbo].[Recursos] OFF
SET IDENTITY_INSERT [dbo].[Solicitud] ON 

INSERT [dbo].[Solicitud] ([idsolicitud], [aula], [nivel], [fechasolicitud], [fechauso], [horainicio], [horafinal], [carrera], [asignatura], [idrecursos], [idusuario]) VALUES (19, N'B4', N'III', CAST(N'2019-07-27' AS Date), CAST(N'2019-07-31' AS Date), CAST(N'10:18:34' AS Time), CAST(N'01:30:54' AS Time), N'Ing en Sistemas', N'Introducción Programación', 4, 4)
INSERT [dbo].[Solicitud] ([idsolicitud], [aula], [nivel], [fechasolicitud], [fechauso], [horainicio], [horafinal], [carrera], [asignatura], [idrecursos], [idusuario]) VALUES (21, N'D1', N'I', CAST(N'2019-08-15' AS Date), CAST(N'2019-08-29' AS Date), CAST(N'03:00:00' AS Time), CAST(N'05:30:00' AS Time), N'Ing Ambiental', N'Calculo II', 5, 4)
INSERT [dbo].[Solicitud] ([idsolicitud], [aula], [nivel], [fechasolicitud], [fechauso], [horainicio], [horafinal], [carrera], [asignatura], [idrecursos], [idusuario]) VALUES (22, N'A9', N'I', CAST(N'2019-08-19' AS Date), CAST(N'2019-08-30' AS Date), CAST(N'09:30:00' AS Time), CAST(N'12:00:00' AS Time), N'ISI', N'Intro Programacion', 9, 7)
SET IDENTITY_INSERT [dbo].[Solicitud] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idusuario], [cedula], [nombres], [apellidos], [email], [telefono]) VALUES (4, N'1211610971001Q', N'Esther', N'Duarte', N'sestherduarte@gmail.com', N'85411756')
INSERT [dbo].[Usuarios] ([idusuario], [cedula], [nombres], [apellidos], [email], [telefono]) VALUES (5, N'123140988LLLL2', N'Alexander', N'Zverev', N'alexander@hotmail.com', N'89099878')
INSERT [dbo].[Usuarios] ([idusuario], [cedula], [nombres], [apellidos], [email], [telefono]) VALUES (6, N'123170899300O', N'Ivania ', N'Lopez', N'ivania@hotmail.com', N'83590099')
INSERT [dbo].[Usuarios] ([idusuario], [cedula], [nombres], [apellidos], [email], [telefono]) VALUES (7, N'0011208981001W', N'Stefanos ', N'Tsitsipas', N'stefanos98@gmail.com', N'78654543')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [NombreUser_Clave]    Script Date: 19/08/2019 1:24:02 ******/
ALTER TABLE [dbo].[Cuentas] ADD  CONSTRAINT [NombreUser_Clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC,
	[nombreuser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NombreRecurso_Codigo]    Script Date: 19/08/2019 1:24:02 ******/
ALTER TABLE [dbo].[Recursos] ADD  CONSTRAINT [NombreRecurso_Codigo] UNIQUE NONCLUSTERED 
(
	[nombrer] ASC,
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [usuario_cedula]    Script Date: 19/08/2019 1:24:02 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [usuario_cedula] UNIQUE NONCLUSTERED 
(
	[cedula] ASC,
	[email] ASC,
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuarios] ([idusuario])
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD FOREIGN KEY([idrecursos])
REFERENCES [dbo].[Recursos] ([idrecursos])
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuarios] ([idusuario])
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [Nivel] CHECK  (([nivel]='I' OR [nivel]='II' OR [nivel]='III' OR [nivel]='IV' OR [nivel]='V'))
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [Nivel]
GO
/****** Object:  StoredProcedure [dbo].[Comentar]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Comentar]
@b int, @idcomentario int, @nombres varchar (100), @correo varchar (50), @telefono varchar (10), @mensaje varchar (max)
as
begin

	SET NOCOUNT ON;

	IF @b=1
		INSERT INTO Comentarios VALUES (@nombres, @correo, @telefono, @mensaje);
	IF @b=2
		SELECT * FROM Comentarios
		
	IF @b=3
		DELETE FROM Comentarios WHERE idcomentario=@idcomentario;
	IF @b=4
		UPDATE Comentarios SET nombres = @nombres, correo = @correo, telefono=@telefono, mensaje=@mensaje where idcomentario=@idcomentario;

	if @b=5
	select * FROM Comentarios
	where nombres LIKE '%' + @nombres + '%'

end


GO
/****** Object:  StoredProcedure [dbo].[pro_cuentas]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pro_cuentas]
@b int, @idcuenta int, @nombreuser varchar (30), @clave VARCHAR (30), @rol varchar (30), @idusuario int
as 
begin
	set nocount on;
	if @b=1
	insert into Cuentas VALUES (@nombreuser, @clave, @rol, @idusuario);

	if @b=2
	SELECT * FROM Cuentas

	if @b=3
	delete from Cuentas where idcuenta=@idcuenta;

	if @b=4
	UPDATE Cuentas SET nombreuser = @nombreuser, clave=@clave, rol = @rol, idusuario=@idusuario where idcuenta=@idcuenta;

	if @b=5
	select * from Cuentas
	where nombreuser LIKE '%' + @nombreuser + '%' or idusuario like '%' + @idusuario + '%'
end


GO
/****** Object:  StoredProcedure [dbo].[recursos_proc]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[recursos_proc]
@b int, @idrecursos int, @nombrer varchar (50), @codigo varchar (50), @descripcion varchar (50)
as
begin
	set nocount on;
	if @b=1
	insert into Recursos VALUES (@nombrer, @codigo, @descripcion);

	if @b=2
	select * from Recursos
	
	if @b=3
	delete from Recursos where idrecursos=@idrecursos;

	if @b=4
	update Recursos SET nombrer=@nombrer, codigo=@codigo, descripcion=@descripcion where idrecursos = @idrecursos;

	if @b=5
	select * from Recursos
	where nombrer like '%' + @nombrer + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[RespaldoBD_GER]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RespaldoBD_GER]
AS
BEGIN

	SET NOCOUNT ON;

	BACKUP DATABASE [bd_ger2]
	to disk = N'C:\Backup\rbd_ger2.bak'
	with checksum;

end
GO
/****** Object:  StoredProcedure [dbo].[solicitud_pr]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[solicitud_pr]
@b int, @idsolicitud int, @aula varchar (10), @nivel varchar (4), @fechasolicitud date, @fechauso date, @horainicio time (7), @horafinal time (7),@carrera varchar (max), @asignatura varchar (max), @idrecursos int, @idusuario int

as
begin

	set nocount on;
	if @b=1
	INSERT INTO Solicitud VALUES (@aula, @nivel,@fechasolicitud, @fechauso, @horainicio,@horafinal, @carrera,@asignatura,@idrecursos, @idusuario);

	IF @b=2
		select * from Solicitud

	if @b=3
		delete from Solicitud where idsolicitud=@idsolicitud;
	
	if @b=4
		update Solicitud SET aula=@aula, nivel=@nivel, fechasolicitud=@fechasolicitud, 
		fechauso=@fechauso, horainicio=@horainicio, horafinal=@horafinal, carrera=@carrera, asignatura=@asignatura, 
		idrecursos = @idrecursos, idusuario=@idusuario where idsolicitud=@idsolicitud;
	
	if @b=5
	select * from Solicitud
	where  aula like '%' + @aula + '%' 

end
GO
/****** Object:  StoredProcedure [dbo].[usuarios_pr]    Script Date: 19/08/2019 1:24:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usuarios_pr]
@b int, @idusuario int, @cedula VARCHAR(14), @nombres VARCHAR (50), @apellidos VARCHAR (50), @email VARCHAR (80), @telefono VARCHAR (20)
AS
BEGIN

	SET NOCOUNT ON;
	if @b=1
	insert into Usuarios VALUES (@cedula, @nombres, @apellidos, @email, @telefono);

	if @b=2
	select * from Usuarios
	

	if @b=3
	delete from Usuarios where idusuario=@idusuario; 

	if @b=4
	UPDATE Usuarios SET cedula=@cedula, nombres=@nombres, apellidos=@apellidos, email=@email, telefono=@telefono where idusuario=@idusuario;

	if @b=5
	select * from Usuarios
	where nombres like '%' + @nombres + '%' or apellidos like '%' + @apellidos + '%'
END


GO
