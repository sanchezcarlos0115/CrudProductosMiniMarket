USE [master]
GO
/****** Object:  Database [MiniMarketDb]    Script Date: 7/11/2021 15:36:20 ******/
CREATE DATABASE [MiniMarketDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiniMarketDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MiniMarketDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MiniMarketDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MiniMarketDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiniMarketDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiniMarketDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiniMarketDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiniMarketDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiniMarketDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiniMarketDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiniMarketDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiniMarketDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiniMarketDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiniMarketDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiniMarketDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiniMarketDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiniMarketDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiniMarketDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiniMarketDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiniMarketDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MiniMarketDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiniMarketDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiniMarketDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiniMarketDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiniMarketDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiniMarketDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiniMarketDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiniMarketDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MiniMarketDb] SET  MULTI_USER 
GO
ALTER DATABASE [MiniMarketDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiniMarketDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiniMarketDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiniMarketDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MiniMarketDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MiniMarketDb]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Estado] [nchar](1) NOT NULL,
 CONSTRAINT [PK_CategoriaProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Medida] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Historico]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Historico](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Medida] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Accion] [varchar](50) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Productos_Historico] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Estado] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (1, N'Carnes y Embutidos', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (2, N'Frutas y Verduras', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (3, N'Panadería y Dulces', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (4, N'Huevos, Lácteos y Café', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (5, N'Aceite, Pasta y Legumbres', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (6, N'Conservas y Comida Preparada', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (7, N'Zumos y Bebidas', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (8, N'Aperitivos', N'I')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (9, N'Infantil', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (10, N'Cosmética y Cuidado Personal', N'A')
INSERT [dbo].[Categorias] ([Id], [Descripcion], [Estado]) VALUES (11, N'Hogar y Limpieza', N'A')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario]) VALUES (1, N'P001', N'Producto test 1', 5, 1, N'La favorita', N'2 ltrs', 10, CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario]) VALUES (2, N'P002', N'Producto test 12', 11, 2, N'Marca Test', N'2 kg', 30, CAST(2.75 AS Decimal(18, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario]) VALUES (3, N'P003', N'Producto test 3', 3, 3, N'Marca Test 3', N'5 grs', 15, CAST(1.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos_Historico] ON 

INSERT [dbo].[Productos_Historico] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario], [Fecha], [Accion], [Usuario]) VALUES (1, N'P001', N'Producto test 1', 5, 1, N'La favorita', N'2 ltrs', 5, CAST(1.25 AS Decimal(18, 2)), CAST(N'2021-11-07T15:20:02.620' AS DateTime), N'Registro insertado', N'DOMRGT\csanchez')
INSERT [dbo].[Productos_Historico] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario], [Fecha], [Accion], [Usuario]) VALUES (2, N'P001', N'Producto test 1', 5, 1, N'La favorita', N'2 ltrs', 10, CAST(1.25 AS Decimal(18, 2)), CAST(N'2021-11-07T15:20:32.787' AS DateTime), N'Registro actualizado', N'DOMRGT\csanchez')
INSERT [dbo].[Productos_Historico] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario], [Fecha], [Accion], [Usuario]) VALUES (3, N'P002', N'Producto test 12', 11, 2, N'Marca Test', N'2 kg', 30, CAST(2.75 AS Decimal(18, 2)), CAST(N'2021-11-07T15:21:56.050' AS DateTime), N'Registro insertado', N'DOMRGT\csanchez')
INSERT [dbo].[Productos_Historico] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario], [Fecha], [Accion], [Usuario]) VALUES (4, N'P003', N'Producto test 3', 3, 3, N'Marca Test 3', N'5 grs', 15, CAST(1.00 AS Decimal(18, 2)), CAST(N'2021-11-07T15:23:09.417' AS DateTime), N'Registro insertado', N'DOMRGT\csanchez')
INSERT [dbo].[Productos_Historico] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario], [Fecha], [Accion], [Usuario]) VALUES (5, N'P004', N'Producto test 4', 10, 3, N'Marca Test 4', N'1 kg', 15, CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-11-07T15:24:24.850' AS DateTime), N'Registro insertado', N'DOMRGT\csanchez')
INSERT [dbo].[Productos_Historico] ([IdProducto], [Codigo], [Descripcion], [IdCategoria], [IdProveedor], [Marca], [Medida], [Cantidad], [PrecioUnitario], [Fecha], [Accion], [Usuario]) VALUES (6, N'P004', N'Producto test 4', 10, 3, N'Marca Test 4', N'1 kg', 15, CAST(3.00 AS Decimal(18, 2)), CAST(N'2021-11-07T15:24:48.590' AS DateTime), N'Registro eliminado', N'DOMRGT\csanchez')
SET IDENTITY_INSERT [dbo].[Productos_Historico] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([IdProveedor], [Descripcion], [Estado]) VALUES (1, N'Proveedor 1', N'A')
INSERT [dbo].[Proveedores] ([IdProveedor], [Descripcion], [Estado]) VALUES (2, N'Proveedor 2', N'A')
INSERT [dbo].[Proveedores] ([IdProveedor], [Descripcion], [Estado]) VALUES (3, N'Proveedor 3', N'A')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerCategorias]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spObtenerCategorias]
as
begin

select * from Categorias where Estado = 'A' 
order by Descripcion;

end
GO
/****** Object:  StoredProcedure [dbo].[spObtenerCategoriasPorId]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerCategoriasPorId]
@IdCategoria int = 0
as
begin

select * from Categorias where Id = @IdCategoria;

end
GO
/****** Object:  StoredProcedure [dbo].[spObtenerProductoPorId]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spObtenerProductoPorId]
@IdProducto int = 0
as
begin

select p.IdProducto,
       p.Codigo,
       p.Descripcion,
	   p.IdCategoria,
	   c.Descripcion as Categoria,
	   p.IdProveedor,
	   prov.Descripcion as Proveedor,
	   p.Marca,
	   p.Medida,
	   p.Cantidad,
	   p.PrecioUnitario
from Productos p
inner join Categorias c on p.IdCategoria = c.Id
inner join Proveedores prov on p.IdProveedor = prov.IdProveedor
where IdProducto = @IdProducto and c.Estado = 'A' and prov.Estado = 'A';

end
GO
/****** Object:  StoredProcedure [dbo].[spObtenerProductos]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spObtenerProductos]
as
begin

select p.IdProducto,
       p.Codigo,
       p.Descripcion,
	   p.IdCategoria,
	   c.Descripcion as Categoria,
	   p.IdProveedor,
	   prov.Descripcion as Proveedor,
	   p.Marca,
	   p.Medida,
	   p.Cantidad,
	   p.PrecioUnitario
from Productos p
inner join Categorias c on p.IdCategoria = c.Id
inner join Proveedores prov on p.IdProveedor = prov.IdProveedor
where c.Estado = 'A' and prov.Estado = 'A';

end
GO
/****** Object:  StoredProcedure [dbo].[spObtenerProveedores]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spObtenerProveedores]
as
begin

select * from Proveedores where Estado = 'A' 
order by Descripcion;

end
GO
/****** Object:  StoredProcedure [dbo].[spObtenerProveedoresPorId]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spObtenerProveedoresPorId]
@IdProveedor int = 0
as
begin

select * from Proveedores where IdProveedor = @IdProveedor;

end
GO
/****** Object:  Trigger [dbo].[TR_ProductoActualizado]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TR_ProductoActualizado]
   ON  [dbo].[Productos]
   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @codigo varchar(20);
	declare @descripcion varchar(50);
	declare @idCategoria int;
	declare @idProveedor int;
	declare @marca varchar(50);
	declare @medida varchar(50);
	declare @cantidad int;
	declare @precioUnit decimal(18,2);
	select @codigo = Codigo,
			@descripcion = Descripcion,
			@idCategoria = IdCategoria,
			@idProveedor = IdProveedor,
			@marca = Marca,
			@medida = Medida,
			@cantidad = Cantidad,
			@precioUnit = PrecioUnitario
			from inserted;
	insert into Productos_Historico 
			values(@codigo,
					@descripcion,
					@idCategoria,
					@idProveedor,
					@marca,
					@medida,
					@cantidad,
					@precioUnit,
					GETDATE(),
					'Registro actualizado',
					SYSTEM_USER); 
END
GO
ALTER TABLE [dbo].[Productos] ENABLE TRIGGER [TR_ProductoActualizado]
GO
/****** Object:  Trigger [dbo].[TR_ProductoEliminado]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TR_ProductoEliminado]
   ON  [dbo].[Productos]
   AFTER delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @codigo varchar(20);
	declare @descripcion varchar(50);
	declare @idCategoria int;
	declare @idProveedor int;
	declare @marca varchar(50);
	declare @medida varchar(50);
	declare @cantidad int;
	declare @precioUnit decimal(18,2);
	select @codigo = Codigo,
			@descripcion = Descripcion,
			@idCategoria = IdCategoria,
			@idProveedor = IdProveedor,
			@marca = Marca,
			@medida = Medida,
			@cantidad = Cantidad,
			@precioUnit = PrecioUnitario
			from deleted;
	insert into Productos_Historico 
			values(@codigo,
					@descripcion,
					@idCategoria,
					@idProveedor,
					@marca,
					@medida,
					@cantidad,
					@precioUnit,
					GETDATE(),
					'Registro eliminado',
					SYSTEM_USER); 
END
GO
ALTER TABLE [dbo].[Productos] ENABLE TRIGGER [TR_ProductoEliminado]
GO
/****** Object:  Trigger [dbo].[TR_ProductoInsertado]    Script Date: 7/11/2021 15:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TR_ProductoInsertado]
   ON  [dbo].[Productos]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @codigo varchar(20);
	declare @descripcion varchar(50);
	declare @idCategoria int;
	declare @idProveedor int;
	declare @marca varchar(50);
	declare @medida varchar(50);
	declare @cantidad int;
	declare @precioUnit decimal(18,2);
	select @codigo = Codigo,
			@descripcion = Descripcion,
			@idCategoria = IdCategoria,
			@idProveedor = IdProveedor,
			@marca = Marca,
			@medida = Medida,
			@cantidad = Cantidad,
			@precioUnit = PrecioUnitario
			from inserted;
	insert into Productos_Historico 
			values(@codigo,
					@descripcion,
					@idCategoria,
					@idProveedor,
					@marca,
					@medida,
					@cantidad,
					@precioUnit,
					GETDATE(),
					'Registro insertado',
					SYSTEM_USER); 
END
GO
ALTER TABLE [dbo].[Productos] ENABLE TRIGGER [TR_ProductoInsertado]
GO
USE [master]
GO
ALTER DATABASE [MiniMarketDb] SET  READ_WRITE 
GO
