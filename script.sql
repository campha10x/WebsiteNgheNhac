USE [Website nghe nhac]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Album]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Album](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenAlBum] [nvarchar](max) NULL,
	[TomTat] [nvarchar](max) NULL,
	[Active] [bit] NULL,
	[UrlImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.tbl_Album] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_BaiHat]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BaiHat](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenBaiHat] [nvarchar](max) NULL,
	[url_BaiHat] [varchar](max) NULL,
	[url_Image] [varchar](max) NULL,
	[LuotNghe] [int] NULL,
	[LuotTai] [int] NULL,
	[Active] [bit] NULL,
	[Id_TheLoai] [bigint] NULL,
	[Id_CaSi] [bigint] NULL,
	[Id_ChuDe] [bigint] NULL,
	[Id_Album] [bigint] NULL,
	[ID_NhacSi] [bigint] NULL,
 CONSTRAINT [PK_tbl_BaiHat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CaSi]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CaSi](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NgheDanh] [nvarchar](max) NULL,
	[TenThat] [nvarchar](max) NULL,
	[NgaySinh] [date] NULL,
	[KhaNang] [nvarchar](max) NULL,
	[TrinhDoHocVan] [nvarchar](max) NULL,
	[MoTaSuNghiep] [nchar](128) NULL,
	[urlImage] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_dbo.tbl_CaSi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ChuDe]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ChuDe](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten_ChuDe] [nvarchar](max) NULL,
	[url_Image] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_dbo.tbl_ChuDe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.tbl_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NguoiDung]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NguoiDung](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[Fb] [nvarchar](500) NULL,
	[Google] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[HoTen] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.tbl_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NhacSi]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhacSi](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](500) NULL,
	[NgaySinh] [datetime] NOT NULL,
	[QueQuan] [nvarchar](500) NULL,
	[HoatDong] [nvarchar](500) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_dbo.tbl_NhacSi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NhanVien]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhanVien](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[tenNV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[gioitinh] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[Id_Quyen] [bigint] NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[Luong] [decimal](18, 0) NULL,
 CONSTRAINT [PK_dbo.tbl_NhanVien] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_QuangCao]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_QuangCao](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UrlImage] [varchar](50) NULL,
	[Active] [bit] NULL,
	[Count_Click] [int] NULL,
 CONSTRAINT [PK_dbo.tbl_QuangCao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Quyen]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Quyen](
	[Id] [bigint] NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.tbl_Quyen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Slide_GioiThieu]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Slide_GioiThieu](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[urlImage] [varchar](200) NULL,
	[Active] [bit] NULL,
	[Count_Click] [int] NULL,
	[UrlNhac] [nvarchar](200) NULL,
	[Title] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.tbl_Slide_GioiThieu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_TheLoai]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TheLoai](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten_TheLoai] [nvarchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_dbo.tbl_TheLoai] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_TinTuc]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TinTuc](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[TomTat] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ngayviet] [date] NULL,
	[id_nhanvien] [bigint] NULL,
	[urlHinhAnh] [nvarchar](max) NULL,
	[LuotXem] [int] NULL,
	[Active] [bit] NULL,
	[Url_BaiHat] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.tbl_TinTuc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Video]    Script Date: 5/29/2017 10:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Video](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten_Video] [nvarchar](500) NULL,
	[Id_CaSi] [bigint] NULL,
	[LuotXem] [int] NULL,
	[Id_TheLoai] [bigint] NULL,
	[Url_Video] [nvarchar](500) NULL,
	[Active] [bit] NULL,
	[Id_ChuDe] [bigint] NULL,
	[Id_NhanVien] [bigint] NULL,
	[NgayDang] [date] NULL,
	[urlImage] [nvarchar](200) NULL,
	[Ord] [int] NULL,
 CONSTRAINT [PK_dbo.tbl_Video] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_Album] ON 

INSERT [dbo].[tbl_Album] ([Id], [TenAlBum], [TomTat], [Active], [UrlImage]) VALUES (1, N'Cha Mẹ Và Quê Hương', N'Cha Mẹ và Quê Hương là Album rất đặc biệt gồm các ca khúc do ca sỹ Tuấn Khương sáng tác và hát. Album này ca sỹ Tuấn Khương muốn gửi lời cảm ơn đến đấng sinh thành và quê hương nơi mình lớn lên.', 1, NULL)
INSERT [dbo].[tbl_Album] ([Id], [TenAlBum], [TomTat], [Active], [UrlImage]) VALUES (2, N'Các Bài Hát Hay Nhất Của bích phương', N'Keeng xin gửi đến các bạn yêu nhạc tuyển tập Album các bài hát hay nhất của Sơn Tùng M-Tp, gồm các bài hát đã làm nên tên tuổi của chàng ca sĩ trẻ này. Cùng lắng nghe và cảm nhận các bạn nhé!', 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Album] OFF
SET IDENTITY_INSERT [dbo].[tbl_BaiHat] ON 

INSERT [dbo].[tbl_BaiHat] ([Id], [TenBaiHat], [url_BaiHat], [url_Image], [LuotNghe], [LuotTai], [Active], [Id_TheLoai], [Id_CaSi], [Id_ChuDe], [Id_Album], [ID_NhacSi]) VALUES (1, N'Bao giờ lấy chồng ', N'/asset/client/Audio_Video/Audio/BaiHat/nmdfP7YU1j8kJvpfpe9g587c77f02ec1f.mp3', N'/asset/client/images/TrangChu/xDYvjupOhPQD3oIkQDMV58999bf984030_103_103.jpg', 64, 0, 1, 9, 1, 1, 2, 2)
INSERT [dbo].[tbl_BaiHat] ([Id], [TenBaiHat], [url_BaiHat], [url_Image], [LuotNghe], [LuotTai], [Active], [Id_TheLoai], [Id_CaSi], [Id_ChuDe], [Id_Album], [ID_NhacSi]) VALUES (2, N'Rằng em mãi ở bên', N'/asset/client/Audio_Video/Audio/BaiHat/Rang_Em_Mai_O_Ben.mp3', N'/asset/client/images/BaiHat/kbMVkRJnruxWGAJgcnMe59127d7cc6b8e_103_103.jpg', 5, 0, 1, 9, 1, 1, 2, 2)
INSERT [dbo].[tbl_BaiHat] ([Id], [TenBaiHat], [url_BaiHat], [url_Image], [LuotNghe], [LuotTai], [Active], [Id_TheLoai], [Id_CaSi], [Id_ChuDe], [Id_Album], [ID_NhacSi]) VALUES (3, N'Ta còn thuộc về nhau', N'/asset/client/Audio_Video/Audio/BaiHat/Ta-Con-Thuoc-Ve-Nhau-Huong-Tram.mp3', N'/asset/client/images/TrangChu/3dfebb3f2a94ed2b0263d671d0ddd1d081f2b0e0_103_103.jpg', 1, 0, 1, 9, 3, 1, 2, 2)
INSERT [dbo].[tbl_BaiHat] ([Id], [TenBaiHat], [url_BaiHat], [url_Image], [LuotNghe], [LuotTai], [Active], [Id_TheLoai], [Id_CaSi], [Id_ChuDe], [Id_Album], [ID_NhacSi]) VALUES (4, N'Xin Anh Đừng', N'/asset/client/Audio_Video/Audio/BaiHat/Xin-Anh-Dung-Dong-Nhi.mp3', N'/asset/client/images/TrangChu/6O6A3bKs0GIzqwi5c61l58f42a0973ac5_103_103.jpg', 3, 0, 1, 9, 4, 1, 2, 2)
INSERT [dbo].[tbl_BaiHat] ([Id], [TenBaiHat], [url_BaiHat], [url_Image], [LuotNghe], [LuotTai], [Active], [Id_TheLoai], [Id_CaSi], [Id_ChuDe], [Id_Album], [ID_NhacSi]) VALUES (5, N'Từ giây phút đầu', N'/asset/client/Audio_Video/Audio/BaiHat/Tu-Giay-Phut-Dau-Hari-Won-Tran-Thanh.mp3', N'/asset/client/images/TrangChu/sr2knbqtet402W0CEzc158c63dd8d38e0_103_103.jpg', 3, 0, 1, 9, 5, 1, 2, 2)
INSERT [dbo].[tbl_BaiHat] ([Id], [TenBaiHat], [url_BaiHat], [url_Image], [LuotNghe], [LuotTai], [Active], [Id_TheLoai], [Id_CaSi], [Id_ChuDe], [Id_Album], [ID_NhacSi]) VALUES (6, N'Từ bỏ', N'/asset/client/Audio_Video/Audio/BaiHat/Rang_Em_Mai_O_Ben.mp3', N'/asset/client/images/TrangChu/xDYvjupOhPQD3oIkQDMV58999bf984030_103_103.jpg', 1, 0, 1, 9, 1, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[tbl_BaiHat] OFF
SET IDENTITY_INSERT [dbo].[tbl_CaSi] ON 

INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (1, N'Bích phương', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/PMdMSbVDqxjkYXuLgpSR59127d7bf2e8a_310_310.jpg', 1)
INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (2, N'The Men', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/JRsfCli4rjJssr2opblL59127b0a87208.jpg', 1)
INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (3, N'Hương Tràm', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/G7lVMQAiOnODFMMAVbJJ590beb3117699.jpg', 1)
INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (4, N'Đông Nhi', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/6j6V6AGv1REcY2Ym4756590be44d18f5d.jpg', 1)
INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (5, N'Hari Won ft Trấn Thành', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/9ay6faRRYTdVPlb86itT590af358ddfc4.jpg', 1)
INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (6, N'Lou Hoàng ft OnlyC', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/IPAvT2rIBmE1yDi7BupB590be616d700f.jpg', 1)
INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (7, N'OnlyC', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/128eb490c3395bf15889b26d320ad0d09c449a77.jpg', 1)
INSERT [dbo].[tbl_CaSi] ([Id], [NgheDanh], [TenThat], [NgaySinh], [KhaNang], [TrinhDoHocVan], [MoTaSuNghiep], [urlImage], [Active]) VALUES (8, N'Hằng BingBoong', NULL, NULL, NULL, NULL, NULL, N'/asset/client/images/Casi/o19hlrrE5HXVq6EdsqnA59159687abe74_310_310.jpg', 1)
SET IDENTITY_INSERT [dbo].[tbl_CaSi] OFF
SET IDENTITY_INSERT [dbo].[tbl_ChuDe] ON 

INSERT [dbo].[tbl_ChuDe] ([Id], [Ten_ChuDe], [url_Image], [Active]) VALUES (1, N'Dành riêng cho em', N'/asset/client/Audio_Video/73a633bdae2326c606011955169254b46fdb4856.mp3', 1)
SET IDENTITY_INSERT [dbo].[tbl_ChuDe] OFF
SET IDENTITY_INSERT [dbo].[tbl_Menu] ON 

INSERT [dbo].[tbl_Menu] ([ID], [Text], [Link], [Target], [Status], [DisplayOrder]) VALUES (5, N'BÀI HÁT', N'/TabBaiHat/Index', N'_self', 1, 1)
INSERT [dbo].[tbl_Menu] ([ID], [Text], [Link], [Target], [Status], [DisplayOrder]) VALUES (6, N'VIDEO', NULL, NULL, 1, 2)
INSERT [dbo].[tbl_Menu] ([ID], [Text], [Link], [Target], [Status], [DisplayOrder]) VALUES (7, N'ALBUM', NULL, NULL, 1, 3)
INSERT [dbo].[tbl_Menu] ([ID], [Text], [Link], [Target], [Status], [DisplayOrder]) VALUES (8, N'BXH', NULL, NULL, 1, 4)
INSERT [dbo].[tbl_Menu] ([ID], [Text], [Link], [Target], [Status], [DisplayOrder]) VALUES (9, N'RADIO', N'/TinTuc/ListTinTuc', N'_self', 1, 5)
INSERT [dbo].[tbl_Menu] ([ID], [Text], [Link], [Target], [Status], [DisplayOrder]) VALUES (10, N'NGHỆ SĨ', N'/Danhsachcasi/Index', N'_self', 1, 6)
INSERT [dbo].[tbl_Menu] ([ID], [Text], [Link], [Target], [Status], [DisplayOrder]) VALUES (11, N'CẢM XÚC ÂM NHẠC', N'/TinTuc/ListTinTuc', N'_self', 1, 7)
SET IDENTITY_INSERT [dbo].[tbl_Menu] OFF
SET IDENTITY_INSERT [dbo].[tbl_NguoiDung] ON 

INSERT [dbo].[tbl_NguoiDung] ([Id], [TaiKhoan], [MatKhau], [Active], [Fb], [Google], [Email], [HoTen]) VALUES (3, N'Pham  Duy', NULL, 1, N'2124888247737648', NULL, N'campha10x@yahoo.com.vn', N'Pham  Duy')
INSERT [dbo].[tbl_NguoiDung] ([Id], [TaiKhoan], [MatKhau], [Active], [Fb], [Google], [Email], [HoTen]) VALUES (15, N'campha10x', N'123456', 1, NULL, NULL, N'8', NULL)
SET IDENTITY_INSERT [dbo].[tbl_NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[tbl_NhacSi] ON 

INSERT [dbo].[tbl_NhacSi] ([Id], [Hoten], [NgaySinh], [QueQuan], [HoatDong], [Active]) VALUES (2, N'Huỳnh Hiền Năng', CAST(0x0000892100000000 AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_NhacSi] OFF
SET IDENTITY_INSERT [dbo].[tbl_NhanVien] ON 

INSERT [dbo].[tbl_NhanVien] ([Id], [tenNV], [NgaySinh], [gioitinh], [ChucVu], [Id_Quyen], [UserName], [Password], [Status], [Luong]) VALUES (6, N'Nguyễn Văn Hiếu', CAST(0xCA3C0B00 AS Date), N'Nam', N'Giám đốc', 1, N'Admin', N'21232f297a57a5a743894a0e4a801fc3', 1, CAST(11128 AS Decimal(18, 0)))
INSERT [dbo].[tbl_NhanVien] ([Id], [tenNV], [NgaySinh], [gioitinh], [ChucVu], [Id_Quyen], [UserName], [Password], [Status], [Luong]) VALUES (10, N'Phạm Xuân Duy', CAST(0xCA3C0B00 AS Date), N'Nữ', NULL, NULL, N'', N'                                                  ', 1, CAST(23 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tbl_NhanVien] OFF
INSERT [dbo].[tbl_Quyen] ([Id], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_Quyen] ([Id], [TenQuyen]) VALUES (2, N'Normal')
SET IDENTITY_INSERT [dbo].[tbl_Slide_GioiThieu] ON 

INSERT [dbo].[tbl_Slide_GioiThieu] ([id], [urlImage], [Active], [Count_Click], [UrlNhac], [Title]) VALUES (1, N'../asset/client/images/TrangChu/ekF2mHCDNI9Tbzn1xGsW58ae96849e4e3_700_293.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[tbl_Slide_GioiThieu] ([id], [urlImage], [Active], [Count_Click], [UrlNhac], [Title]) VALUES (2, N'../asset/client/images/TrangChu/ekF2mHCDNI9Tbzn1xGsW58ae96849e4e3_700_293.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[tbl_Slide_GioiThieu] ([id], [urlImage], [Active], [Count_Click], [UrlNhac], [Title]) VALUES (3, N'../asset/client/images/TrangChu/ekF2mHCDNI9Tbzn1xGsW58ae96849e4e3_700_293.jpg', 1, NULL, NULL, NULL)
INSERT [dbo].[tbl_Slide_GioiThieu] ([id], [urlImage], [Active], [Count_Click], [UrlNhac], [Title]) VALUES (4, N'../asset/client/images/TrangChu/ekF2mHCDNI9Tbzn1xGsW58ae96849e4e3_700_293.jpg', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Slide_GioiThieu] OFF
SET IDENTITY_INSERT [dbo].[tbl_TheLoai] ON 

INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (1, N'Pop Hàn Quốc', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (2, N'Pop Việt', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (3, N'Nhạc trữ tình', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (4, N'Nhạc Dance', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (5, N'Nhạc cách mạng', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (6, N'Rap Việt', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (7, N'Radio', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (8, N'Nhạc Trịnh ', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (9, N'Nhạc việt', 1)
INSERT [dbo].[tbl_TheLoai] ([Id], [Ten_TheLoai], [Active]) VALUES (10, N'Nhạc phim', 1)
SET IDENTITY_INSERT [dbo].[tbl_TheLoai] OFF
SET IDENTITY_INSERT [dbo].[tbl_TinTuc] ON 

INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (13, N'Thế giới à, xin hãy thông cảm cho những người yêu đơn phương ', N'<p>L&agrave; những người đ&atilde; d&agrave;nh hết nguồn sống để hy sinh cho một người kh&ocirc;ng quan t&acirc;m đến họ, n&ecirc;n những kẻ y&ecirc;u đơn phương lu&ocirc;n mang một nỗi tủi hờn, thi thoảng đi&ecirc;n rồ, tự kỷ. V&igrave; vậy d&ugrave; cho họ c&oacute; h&acirc;m hấp một ch&uacute;t, l&agrave;m tr&aacute;i lẽ đời một ch&uacute;t th&igrave; cả thế giới n&agrave;y cứ rộng lượng m&agrave; th&ocirc;ng cảm cho họ đi.</p>
', N'<p>Nếu t&ocirc;i c&oacute; quyền b&igrave;nh chọn cho thể loại t&igrave;nh y&ecirc;u n&agrave;o đ&aacute;ng gh&eacute;t nhất th&igrave; t&ocirc;i sẽ b&igrave;nh chọn cho y&ecirc;u đơn phương. T&igrave;nh y&ecirc;u đơn phương d&ugrave; c&oacute; đẹp đến mấy, d&ugrave; c&oacute; thủy chung, si t&igrave;nh đến mấy th&igrave; cũng chẳng hạnh ph&uacute;c được. Sẵn s&agrave;ng nhận &#39;th&iacute;nh&#39;, &#39;đớp th&iacute;nh&#39; mọi l&uacute;c mọi nơi mọi thời điểm, thi thoảng cười như h&acirc;m dở v&igrave; được người ta hỏi han quan t&acirc;m một ch&uacute;t, nhưng c&oacute; l&uacute;c lại kh&oacute;c như mưa v&igrave; h&oacute;a ra người ấy lại chẳng c&oacute; t&igrave;nh cảm g&igrave; với m&igrave;nh.</p>

<p>Người ta cứ bảo muốn hạnh ph&uacute;c th&igrave; phải đấu tranh, thế nhưng d&ugrave; c&oacute; một l&ograve;ng một dạ y&ecirc;u đương người ta th&igrave; cũng l&agrave; v&ocirc; &iacute;ch. Kh&ocirc;ng y&ecirc;u l&agrave; kh&ocirc;ng y&ecirc;u. Đ&acirc;u cứ bảo qu&ecirc;n l&agrave; qu&ecirc;n được, đ&acirc;u cứ bảo th&ocirc;i nhớ l&agrave; kh&ocirc;ng nhớ nữa, đ&acirc;u cứ bảo phải lạnh l&ugrave;ng l&agrave; lạnh l&ugrave;ng được đ&acirc;u. Khổ t&acirc;m lắm!</p>

<p>Vậy n&ecirc;n thế giới &agrave;, cụ thể hơn l&agrave; bạn b&egrave; &agrave;, xin h&atilde;y th&ocirc;ng cảm cho những đứa b&ecirc;n cạnh bạn đang y&ecirc;u đơn phương. Đ&oacute; l&agrave; l&uacute;c bạn thấy c&ocirc; bạn th&acirc;n của m&igrave;nh nhạy cảm nhất, v&agrave; cũng&hellip; đ&aacute;ng sợ nhất. Tưởng chừng ng&agrave;y n&agrave;o n&oacute; cũng đang sống trong t&igrave;nh y&ecirc;u, m&agrave; kh&ocirc;ng phải y&ecirc;u say đắm, m&agrave; l&agrave;&hellip; thất t&igrave;nh.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/cxan08052017.jpg" /></p>

<p>T&igrave;nh y&ecirc;u đơn phương c&oacute; đẹp th&igrave; cũng chẳng hạnh ph&uacute;c đ&acirc;u! Ảnh minh họa.</p>

<p>H&atilde;y quan t&acirc;m đến họ - những kẻ đang y&ecirc;u đơn phương nhiều hơn, v&igrave; thực sự họ rất c&ocirc; đơn. Sẽ c&oacute; đ&ocirc;i l&uacute;c họ n&oacute;ng giận v&ocirc; cớ th&igrave; cứ h&atilde;y nhường nhịn một ch&uacute;t, v&igrave; tr&aacute;i tim của những kẻ-đ&aacute;ng-sợ-n&agrave;y giờ đang rất nhạy cảm. Bạn đừng ngạc nhi&ecirc;n khi đi đường nh&igrave;n thấy những cặp đ&ocirc;i nắm tay, &ocirc;m nhau họ cũng thở d&agrave;i chạnh l&ograve;ng, đừng ngạc nhi&ecirc;n khi bỗng dưng c&aacute;i đứa suốt ng&agrave;y cười tươi như hoa bỗng dưng kh&oacute;c đến sưng mắt. Cũng đừng bất ngờ khi n&oacute; bỗng sửng cồ l&ecirc;n bảo tao sẽ cắt t&oacute;c đầu h&uacute;i cua, sẽ kh&ocirc;ng y&ecirc;u con trai nữa, sẽ l&agrave;m những chuyện m&agrave; d&ugrave; c&oacute; huy động tr&iacute; tưởng tượng của m&igrave;nh vẫn kh&ocirc;ng thể n&agrave;o hiểu nổi.</p>

<p>Bạn h&atilde;y th&ocirc;ng cảm cho c&aacute;i đứa m&agrave; từng tưng tửng như m&ugrave;a xu&acirc;n lu&ocirc;n ngập tr&agrave;n trong l&ograve;ng giờ lại suốt ng&agrave;y viết mấy status sến sẩm n&atilde;o nề. Khi tr&aacute;i tim mỏng manh đ&atilde; bị x&acirc;m chiếm bởi những &yacute; nghĩ sắt đ&aacute; th&igrave; con người ta thay đổi nhiều lắm. Những l&uacute;c n&agrave;y h&atilde;y đưa c&ocirc; ta đi ăn, đi chơi, đừng bỏ mặc con người đ&aacute;ng thương ấy. C&ocirc; ta sẽ buồn v&agrave; c&ocirc; đơn lắm lắm.</p>

<p>C&ograve;n nữa l&agrave; h&atilde;y động vi&ecirc;n họ thường xuy&ecirc;n, kh&ocirc;ng phải l&agrave; những c&acirc;u kiểu trời ơi đất hỡi như &#39;tr&ecirc;n đời n&agrave;y thiếu g&igrave; trai đẹp trai tốt d&agrave;nh cho m&agrave;y, việc g&igrave; phải y&ecirc;u c&aacute;i thằng dở hơi ấy&#39;, bởi đ&acirc;u c&oacute; thằng n&agrave;o tốt đẹp xuất hiện ngay b&acirc;y giờ để thay thế đ&acirc;u. M&agrave; l&agrave; h&atilde;y động vi&ecirc;n rằng &#39;thời tiết h&ocirc;m nay cũng hơi hơi đẹp, nếu kh&ocirc;ng ra ngo&agrave;i đi ăn một b&aacute;t b&uacute;n sườn, miến ngan, nem r&aacute;n, ngao ốc&hellip; th&igrave; quả thực c&oacute; lỗi với thời tiết lắm&#39;. N&oacute;i thế th&igrave; đảm bảo cả thế giới sẽ bừng tỉnh lu&ocirc;n, chẳng c&oacute; ai buồn rầu m&atilde;i được.</p>

<p>T&igrave;nh y&ecirc;u cứ khiến con người ta trở n&ecirc;n ng&acirc;y ngốc như thế, với những người xung quanh ch&uacute;ng m&igrave;nh, giả dụ họ c&oacute; k&eacute;m may mắn m&agrave; đi y&ecirc;u đơn phương một người, d&agrave;nh hết t&igrave;nh cảm cho một người nhưng kh&ocirc;ng được đ&aacute;p lại th&igrave; ta cứ th&ocirc;ng cảm, quan t&acirc;m để &#39;cứu rỗi&#39; tr&aacute;i tim đ&aacute;ng thương n&agrave;y đi vậy.</p>

<p>Nhưng nếu đ&ocirc;i l&uacute;c đứa bạn th&acirc;n của bạn m&agrave; đi&ecirc;n qu&aacute;, thần kinh qu&aacute; th&igrave; cũng n&ecirc;n tr&aacute;nh xa xa, bởi ch&uacute;ng ta sẽ kh&ocirc;ng biết n&oacute; ph&aacute;t nổ bất kỳ l&uacute;c n&agrave;o đ&acirc;u.</p>

<p>V&agrave; khi đ&atilde; đọc đến đ&acirc;y rồi, th&igrave; sao kh&ocirc;ng thử nhấc điện thoại l&ecirc;n v&agrave; gọi cho kẻ đang y&ecirc;u đơn phương ấy đi: &#39;M&agrave;y ơi, th&ocirc;i th&igrave; thằng kia c&oacute; mắt v&igrave; kh&ocirc;ng y&ecirc;u đứa vừa xấu vừa đi&ecirc;n như m&agrave;y, nhưng m&agrave; th&ocirc;i đời th&igrave; n&ecirc;n chấp nhận, chi bằng đi ăn đi!&#39;...</p>
', CAST(0xD13C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 2, 1, NULL)
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (14, N'Thế giới à, xin hãy thông cảm cho những người yêu đơn phương', N'<p>L&agrave; những người đ&atilde; d&agrave;nh hết nguồn sống để hy sinh cho một người kh&ocirc;ng quan t&acirc;m đến họ, n&ecirc;n những kẻ y&ecirc;u đơn phương lu&ocirc;n mang một nỗi tủi hờn, thi thoảng đi&ecirc;n rồ, tự kỷ. V&igrave; vậy d&ugrave; cho họ c&oacute; h&acirc;m hấp một ch&uacute;t, l&agrave;m tr&aacute;i lẽ đời một ch&uacute;t th&igrave; cả thế giới n&agrave;y cứ rộng lượng m&agrave; th&ocirc;ng cảm cho họ đi.</p>
', N'<p>Nếu t&ocirc;i c&oacute; quyền b&igrave;nh chọn cho thể loại t&igrave;nh y&ecirc;u n&agrave;o đ&aacute;ng gh&eacute;t nhất th&igrave; t&ocirc;i sẽ b&igrave;nh chọn cho y&ecirc;u đơn phương. T&igrave;nh y&ecirc;u đơn phương d&ugrave; c&oacute; đẹp đến mấy, d&ugrave; c&oacute; thủy chung, si t&igrave;nh đến mấy th&igrave; cũng chẳng hạnh ph&uacute;c được. Sẵn s&agrave;ng nhận &#39;th&iacute;nh&#39;, &#39;đớp th&iacute;nh&#39; mọi l&uacute;c mọi nơi mọi thời điểm, thi thoảng cười như h&acirc;m dở v&igrave; được người ta hỏi han quan t&acirc;m một ch&uacute;t, nhưng c&oacute; l&uacute;c lại kh&oacute;c như mưa v&igrave; h&oacute;a ra người ấy lại chẳng c&oacute; t&igrave;nh cảm g&igrave; với m&igrave;nh.</p>

<p>Người ta cứ bảo muốn hạnh ph&uacute;c th&igrave; phải đấu tranh, thế nhưng d&ugrave; c&oacute; một l&ograve;ng một dạ y&ecirc;u đương người ta th&igrave; cũng l&agrave; v&ocirc; &iacute;ch. Kh&ocirc;ng y&ecirc;u l&agrave; kh&ocirc;ng y&ecirc;u. Đ&acirc;u cứ bảo qu&ecirc;n l&agrave; qu&ecirc;n được, đ&acirc;u cứ bảo th&ocirc;i nhớ l&agrave; kh&ocirc;ng nhớ nữa, đ&acirc;u cứ bảo phải lạnh l&ugrave;ng l&agrave; lạnh l&ugrave;ng được đ&acirc;u. Khổ t&acirc;m lắm!</p>

<p>Vậy n&ecirc;n thế giới &agrave;, cụ thể hơn l&agrave; bạn b&egrave; &agrave;, xin h&atilde;y th&ocirc;ng cảm cho những đứa b&ecirc;n cạnh bạn đang y&ecirc;u đơn phương. Đ&oacute; l&agrave; l&uacute;c bạn thấy c&ocirc; bạn th&acirc;n của m&igrave;nh nhạy cảm nhất, v&agrave; cũng&hellip; đ&aacute;ng sợ nhất. Tưởng chừng ng&agrave;y n&agrave;o n&oacute; cũng đang sống trong t&igrave;nh y&ecirc;u, m&agrave; kh&ocirc;ng phải y&ecirc;u say đắm, m&agrave; l&agrave;&hellip; thất t&igrave;nh.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/cxan08052017.jpg" /></p>

<p>T&igrave;nh y&ecirc;u đơn phương c&oacute; đẹp th&igrave; cũng chẳng hạnh ph&uacute;c đ&acirc;u! Ảnh minh họa.</p>

<p>H&atilde;y quan t&acirc;m đến họ - những kẻ đang y&ecirc;u đơn phương nhiều hơn, v&igrave; thực sự họ rất c&ocirc; đơn. Sẽ c&oacute; đ&ocirc;i l&uacute;c họ n&oacute;ng giận v&ocirc; cớ th&igrave; cứ h&atilde;y nhường nhịn một ch&uacute;t, v&igrave; tr&aacute;i tim của những kẻ-đ&aacute;ng-sợ-n&agrave;y giờ đang rất nhạy cảm. Bạn đừng ngạc nhi&ecirc;n khi đi đường nh&igrave;n thấy những cặp đ&ocirc;i nắm tay, &ocirc;m nhau họ cũng thở d&agrave;i chạnh l&ograve;ng, đừng ngạc nhi&ecirc;n khi bỗng dưng c&aacute;i đứa suốt ng&agrave;y cười tươi như hoa bỗng dưng kh&oacute;c đến sưng mắt. Cũng đừng bất ngờ khi n&oacute; bỗng sửng cồ l&ecirc;n bảo tao sẽ cắt t&oacute;c đầu h&uacute;i cua, sẽ kh&ocirc;ng y&ecirc;u con trai nữa, sẽ l&agrave;m những chuyện m&agrave; d&ugrave; c&oacute; huy động tr&iacute; tưởng tượng của m&igrave;nh vẫn kh&ocirc;ng thể n&agrave;o hiểu nổi.</p>

<p>Bạn h&atilde;y th&ocirc;ng cảm cho c&aacute;i đứa m&agrave; từng tưng tửng như m&ugrave;a xu&acirc;n lu&ocirc;n ngập tr&agrave;n trong l&ograve;ng giờ lại suốt ng&agrave;y viết mấy status sến sẩm n&atilde;o nề. Khi tr&aacute;i tim mỏng manh đ&atilde; bị x&acirc;m chiếm bởi những &yacute; nghĩ sắt đ&aacute; th&igrave; con người ta thay đổi nhiều lắm. Những l&uacute;c n&agrave;y h&atilde;y đưa c&ocirc; ta đi ăn, đi chơi, đừng bỏ mặc con người đ&aacute;ng thương ấy. C&ocirc; ta sẽ buồn v&agrave; c&ocirc; đơn lắm lắm.</p>

<p>C&ograve;n nữa l&agrave; h&atilde;y động vi&ecirc;n họ thường xuy&ecirc;n, kh&ocirc;ng phải l&agrave; những c&acirc;u kiểu trời ơi đất hỡi như &#39;tr&ecirc;n đời n&agrave;y thiếu g&igrave; trai đẹp trai tốt d&agrave;nh cho m&agrave;y, việc g&igrave; phải y&ecirc;u c&aacute;i thằng dở hơi ấy&#39;, bởi đ&acirc;u c&oacute; thằng n&agrave;o tốt đẹp xuất hiện ngay b&acirc;y giờ để thay thế đ&acirc;u. M&agrave; l&agrave; h&atilde;y động vi&ecirc;n rằng &#39;thời tiết h&ocirc;m nay cũng hơi hơi đẹp, nếu kh&ocirc;ng ra ngo&agrave;i đi ăn một b&aacute;t b&uacute;n sườn, miến ngan, nem r&aacute;n, ngao ốc&hellip; th&igrave; quả thực c&oacute; lỗi với thời tiết lắm&#39;. N&oacute;i thế th&igrave; đảm bảo cả thế giới sẽ bừng tỉnh lu&ocirc;n, chẳng c&oacute; ai buồn rầu m&atilde;i được.</p>

<p>T&igrave;nh y&ecirc;u cứ khiến con người ta trở n&ecirc;n ng&acirc;y ngốc như thế, với những người xung quanh ch&uacute;ng m&igrave;nh, giả dụ họ c&oacute; k&eacute;m may mắn m&agrave; đi y&ecirc;u đơn phương một người, d&agrave;nh hết t&igrave;nh cảm cho một người nhưng kh&ocirc;ng được đ&aacute;p lại th&igrave; ta cứ th&ocirc;ng cảm, quan t&acirc;m để &#39;cứu rỗi&#39; tr&aacute;i tim đ&aacute;ng thương n&agrave;y đi vậy.</p>

<p>Nhưng nếu đ&ocirc;i l&uacute;c đứa bạn th&acirc;n của bạn m&agrave; đi&ecirc;n qu&aacute;, thần kinh qu&aacute; th&igrave; cũng n&ecirc;n tr&aacute;nh xa xa, bởi ch&uacute;ng ta sẽ kh&ocirc;ng biết n&oacute; ph&aacute;t nổ bất kỳ l&uacute;c n&agrave;o đ&acirc;u.</p>

<p>V&agrave; khi đ&atilde; đọc đến đ&acirc;y rồi, th&igrave; sao kh&ocirc;ng thử nhấc điện thoại l&ecirc;n v&agrave; gọi cho kẻ đang y&ecirc;u đơn phương ấy đi: &#39;M&agrave;y ơi, th&ocirc;i th&igrave; thằng kia c&oacute; mắt v&igrave; kh&ocirc;ng y&ecirc;u đứa vừa xấu vừa đi&ecirc;n như m&agrave;y, nhưng m&agrave; th&ocirc;i đời th&igrave; n&ecirc;n chấp nhận, chi bằng đi ăn đi!&#39;...</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 2, 1, NULL)
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (15, N'Thế giới à, xin hãy thông cảm cho những người yêu đơn phương', N'<p>L&agrave; những người đ&atilde; d&agrave;nh hết nguồn sống để hy sinh cho một người kh&ocirc;ng quan t&acirc;m đến họ, n&ecirc;n những kẻ y&ecirc;u đơn phương lu&ocirc;n mang một nỗi tủi hờn, thi thoảng đi&ecirc;n rồ, tự kỷ. V&igrave; vậy d&ugrave; cho họ c&oacute; h&acirc;m hấp một ch&uacute;t, l&agrave;m tr&aacute;i lẽ đời một ch&uacute;t th&igrave; cả thế giới n&agrave;y cứ rộng lượng m&agrave; th&ocirc;ng cảm cho họ đi.</p>
', N'<p>Nếu t&ocirc;i c&oacute; quyền b&igrave;nh chọn cho thể loại t&igrave;nh y&ecirc;u n&agrave;o đ&aacute;ng gh&eacute;t nhất th&igrave; t&ocirc;i sẽ b&igrave;nh chọn cho y&ecirc;u đơn phương. T&igrave;nh y&ecirc;u đơn phương d&ugrave; c&oacute; đẹp đến mấy, d&ugrave; c&oacute; thủy chung, si t&igrave;nh đến mấy th&igrave; cũng chẳng hạnh ph&uacute;c được. Sẵn s&agrave;ng nhận &#39;th&iacute;nh&#39;, &#39;đớp th&iacute;nh&#39; mọi l&uacute;c mọi nơi mọi thời điểm, thi thoảng cười như h&acirc;m dở v&igrave; được người ta hỏi han quan t&acirc;m một ch&uacute;t, nhưng c&oacute; l&uacute;c lại kh&oacute;c như mưa v&igrave; h&oacute;a ra người ấy lại chẳng c&oacute; t&igrave;nh cảm g&igrave; với m&igrave;nh.</p>

<p>Người ta cứ bảo muốn hạnh ph&uacute;c th&igrave; phải đấu tranh, thế nhưng d&ugrave; c&oacute; một l&ograve;ng một dạ y&ecirc;u đương người ta th&igrave; cũng l&agrave; v&ocirc; &iacute;ch. Kh&ocirc;ng y&ecirc;u l&agrave; kh&ocirc;ng y&ecirc;u. Đ&acirc;u cứ bảo qu&ecirc;n l&agrave; qu&ecirc;n được, đ&acirc;u cứ bảo th&ocirc;i nhớ l&agrave; kh&ocirc;ng nhớ nữa, đ&acirc;u cứ bảo phải lạnh l&ugrave;ng l&agrave; lạnh l&ugrave;ng được đ&acirc;u. Khổ t&acirc;m lắm!</p>

<p>Vậy n&ecirc;n thế giới &agrave;, cụ thể hơn l&agrave; bạn b&egrave; &agrave;, xin h&atilde;y th&ocirc;ng cảm cho những đứa b&ecirc;n cạnh bạn đang y&ecirc;u đơn phương. Đ&oacute; l&agrave; l&uacute;c bạn thấy c&ocirc; bạn th&acirc;n của m&igrave;nh nhạy cảm nhất, v&agrave; cũng&hellip; đ&aacute;ng sợ nhất. Tưởng chừng ng&agrave;y n&agrave;o n&oacute; cũng đang sống trong t&igrave;nh y&ecirc;u, m&agrave; kh&ocirc;ng phải y&ecirc;u say đắm, m&agrave; l&agrave;&hellip; thất t&igrave;nh.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/cxan08052017.jpg" /></p>

<p>T&igrave;nh y&ecirc;u đơn phương c&oacute; đẹp th&igrave; cũng chẳng hạnh ph&uacute;c đ&acirc;u! Ảnh minh họa.</p>

<p>H&atilde;y quan t&acirc;m đến họ - những kẻ đang y&ecirc;u đơn phương nhiều hơn, v&igrave; thực sự họ rất c&ocirc; đơn. Sẽ c&oacute; đ&ocirc;i l&uacute;c họ n&oacute;ng giận v&ocirc; cớ th&igrave; cứ h&atilde;y nhường nhịn một ch&uacute;t, v&igrave; tr&aacute;i tim của những kẻ-đ&aacute;ng-sợ-n&agrave;y giờ đang rất nhạy cảm. Bạn đừng ngạc nhi&ecirc;n khi đi đường nh&igrave;n thấy những cặp đ&ocirc;i nắm tay, &ocirc;m nhau họ cũng thở d&agrave;i chạnh l&ograve;ng, đừng ngạc nhi&ecirc;n khi bỗng dưng c&aacute;i đứa suốt ng&agrave;y cười tươi như hoa bỗng dưng kh&oacute;c đến sưng mắt. Cũng đừng bất ngờ khi n&oacute; bỗng sửng cồ l&ecirc;n bảo tao sẽ cắt t&oacute;c đầu h&uacute;i cua, sẽ kh&ocirc;ng y&ecirc;u con trai nữa, sẽ l&agrave;m những chuyện m&agrave; d&ugrave; c&oacute; huy động tr&iacute; tưởng tượng của m&igrave;nh vẫn kh&ocirc;ng thể n&agrave;o hiểu nổi.</p>

<p>Bạn h&atilde;y th&ocirc;ng cảm cho c&aacute;i đứa m&agrave; từng tưng tửng như m&ugrave;a xu&acirc;n lu&ocirc;n ngập tr&agrave;n trong l&ograve;ng giờ lại suốt ng&agrave;y viết mấy status sến sẩm n&atilde;o nề. Khi tr&aacute;i tim mỏng manh đ&atilde; bị x&acirc;m chiếm bởi những &yacute; nghĩ sắt đ&aacute; th&igrave; con người ta thay đổi nhiều lắm. Những l&uacute;c n&agrave;y h&atilde;y đưa c&ocirc; ta đi ăn, đi chơi, đừng bỏ mặc con người đ&aacute;ng thương ấy. C&ocirc; ta sẽ buồn v&agrave; c&ocirc; đơn lắm lắm.</p>

<p>C&ograve;n nữa l&agrave; h&atilde;y động vi&ecirc;n họ thường xuy&ecirc;n, kh&ocirc;ng phải l&agrave; những c&acirc;u kiểu trời ơi đất hỡi như &#39;tr&ecirc;n đời n&agrave;y thiếu g&igrave; trai đẹp trai tốt d&agrave;nh cho m&agrave;y, việc g&igrave; phải y&ecirc;u c&aacute;i thằng dở hơi ấy&#39;, bởi đ&acirc;u c&oacute; thằng n&agrave;o tốt đẹp xuất hiện ngay b&acirc;y giờ để thay thế đ&acirc;u. M&agrave; l&agrave; h&atilde;y động vi&ecirc;n rằng &#39;thời tiết h&ocirc;m nay cũng hơi hơi đẹp, nếu kh&ocirc;ng ra ngo&agrave;i đi ăn một b&aacute;t b&uacute;n sườn, miến ngan, nem r&aacute;n, ngao ốc&hellip; th&igrave; quả thực c&oacute; lỗi với thời tiết lắm&#39;. N&oacute;i thế th&igrave; đảm bảo cả thế giới sẽ bừng tỉnh lu&ocirc;n, chẳng c&oacute; ai buồn rầu m&atilde;i được.</p>

<p>T&igrave;nh y&ecirc;u cứ khiến con người ta trở n&ecirc;n ng&acirc;y ngốc như thế, với những người xung quanh ch&uacute;ng m&igrave;nh, giả dụ họ c&oacute; k&eacute;m may mắn m&agrave; đi y&ecirc;u đơn phương một người, d&agrave;nh hết t&igrave;nh cảm cho một người nhưng kh&ocirc;ng được đ&aacute;p lại th&igrave; ta cứ th&ocirc;ng cảm, quan t&acirc;m để &#39;cứu rỗi&#39; tr&aacute;i tim đ&aacute;ng thương n&agrave;y đi vậy.</p>

<p>Nhưng nếu đ&ocirc;i l&uacute;c đứa bạn th&acirc;n của bạn m&agrave; đi&ecirc;n qu&aacute;, thần kinh qu&aacute; th&igrave; cũng n&ecirc;n tr&aacute;nh xa xa, bởi ch&uacute;ng ta sẽ kh&ocirc;ng biết n&oacute; ph&aacute;t nổ bất kỳ l&uacute;c n&agrave;o đ&acirc;u.</p>

<p>V&agrave; khi đ&atilde; đọc đến đ&acirc;y rồi, th&igrave; sao kh&ocirc;ng thử nhấc điện thoại l&ecirc;n v&agrave; gọi cho kẻ đang y&ecirc;u đơn phương ấy đi: &#39;M&agrave;y ơi, th&ocirc;i th&igrave; thằng kia c&oacute; mắt v&igrave; kh&ocirc;ng y&ecirc;u đứa vừa xấu vừa đi&ecirc;n như m&agrave;y, nhưng m&agrave; th&ocirc;i đời th&igrave; n&ecirc;n chấp nhận, chi bằng đi ăn đi!&#39;...</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 2, 1, NULL)
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (18, N'Này con gái, khi yêu ai hãy giấu sẵn những cái gai để tự bảo vệ mình', N'<p>Đừng hiền l&agrave;nh qu&aacute;, cũng đừng y&ecirc;u ai nhiều qu&aacute; đến nỗi qu&ecirc;n đi bản th&acirc;n m&igrave;nh. Khi y&ecirc;u ai d&ugrave;ng tr&aacute;i tim nhiều một t&iacute; cũng được, nhưng cũng n&ecirc;n giấu sẵn v&agrave;i c&aacute;i gai, nếu ai l&agrave;m bạn đau, h&atilde;y tự bảo vệ m&igrave;nh.</p>

<p>&nbsp;</p>
', N'<p>T&ocirc;i thường thấy c&aacute;c c&ocirc; g&aacute;i c&agrave;ng hiền l&agrave;nh, c&agrave;ng ngoan ngo&atilde;n, c&agrave;ng yếu đuối th&igrave; lại c&agrave;ng lụy t&igrave;nh. T&igrave;nh y&ecirc;u l&agrave; tr&ograve; chơi c&uacute;t bắt của tuổi trẻ, người may mắn th&igrave; thắng cuộc, c&ograve;n hầu hết ch&uacute;ng ta đều thua. L&agrave; con g&aacute;i, đừng cứ đơn giản nghĩ chỉ cần m&igrave;nh tốt v&agrave; nhiệt th&agrave;nh với anh ta, th&igrave; anh ta sẽ lu&ocirc;n đối xử tốt với m&igrave;nh. Tất nhi&ecirc;n anh ấy sẽ tốt với bạn, y&ecirc;u thương bạn nhưng đi qua thời gian, chẳng ai d&aacute;m chắc điều n&agrave;y tồn tại vĩnh viễn.</p>

<p>T&ocirc;i c&oacute; quen một v&agrave;i c&ocirc; g&aacute;i như thế n&agrave;y. C&aacute;c c&ocirc; ấy xem t&igrave;nh y&ecirc;u l&agrave; sinh mệnh, trao đi tất cả những thứ tốt đẹp nhất trong tay cho một anh ch&agrave;ng. Họ rất hiền l&agrave;nh, rất xinh, rất đảm đang, rất ho&agrave;n hảo, ai cũng nghĩ những anh ch&agrave;ng kia thật may mắn. Ai cũng nghĩ những c&ocirc; bạn kia cả đời n&agrave;y sẽ chẳng c&ograve;n phải lo c&oacute; được y&ecirc;u thương chiều chuộng hay kh&ocirc;ng.</p>

<p>Thế rồi đ&ugrave;ng c&aacute;i một ng&agrave;y, mấy c&ocirc; g&aacute;i xinh đẹp kia gặp t&ocirc;i với một đ&ocirc;i mắt sưng h&uacute;p. C&oacute; người kh&oacute;c l&oacute;c bảo t&igrave;nh y&ecirc;u kh&ocirc;ng như &yacute; muốn, anh ấy hết lần n&agrave;y đến lượt kh&aacute;c l&agrave;m c&ocirc; đau khổ. N&agrave;o ngoại t&igrave;nh, n&agrave;o y&ecirc;u l&eacute;n l&uacute;t người kh&aacute;c, biến c&ocirc; trở th&agrave;nh người thứ ba. Đến người kh&aacute;c th&igrave; suốt ng&agrave;y b&ecirc; tha, đ&aacute;nh đập c&ocirc; đủ kiểu, tr&ecirc;n người l&uacute;c n&agrave;o cũng v&agrave;i vết t&iacute;m bầm. C&oacute; c&ocirc; chẳng v&igrave; l&yacute; do n&agrave;o cả, chỉ v&igrave; hắn ta bảo kh&ocirc;ng c&ograve;n y&ecirc;u c&ocirc;, muốn chia tay.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/con-gai-luon-cuoi.jpg" /></p>

<p>Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do. Ảnh minh họa.</p>

<p>Chuyện t&igrave;nh y&ecirc;u n&agrave;o ai biết trước được những điều sẽ xảy ra. T&ocirc;i chỉ khuy&ecirc;n c&aacute;c c&ocirc; rằng, ở trong thời đại n&agrave;y, đừng y&ecirc;u ai đến nỗi khiến bản th&acirc;n m&igrave;nh quỵ lụy. H&atilde;y t&iacute;ch lũy cho m&igrave;nh thật nhiều bản lĩnh, thật nhiều dũng cảm, mạnh mẽ, để khi chia tay rồi, kh&ocirc;ng c&ograve;n ai để yếu đuối, nương tựa th&igrave; bản th&acirc;n vẫn phải vững v&agrave;ng để bước tiếp, chiến đấu với cuộc đời.</p>

<p>Đừng bao giờ quỵ lụy với một người đ&agrave;n &ocirc;ng kh&ocirc;ng mang lại cho m&igrave;nh hạnh ph&uacute;c. Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do.</p>

<p>Bản th&acirc;n ch&uacute;ng ta l&agrave; những c&ocirc; g&aacute;i khi y&ecirc;u thường qu&ecirc;n mất mọi thứ xung quanh, cuộc sống của ch&uacute;ng ta chỉ biết xoay người ấy, để rồi khi người ta kh&ocirc;ng c&ograve;n ở lại nữa th&igrave; cảm thấy bầu trời kh&ocirc;ng trong xanh, cơm ăn kh&ocirc;ng ngon, cười kh&ocirc;ng hạnh ph&uacute;c. Bởi thế, những c&ocirc; g&aacute;i khi y&ecirc;u n&ecirc;n giấu sẵn những c&aacute;i gai trong người, để l&uacute;c cần tỉnh t&aacute;o h&atilde;y tỉnh t&aacute;o v&agrave; sẵn s&agrave;ng lao v&agrave;o &lsquo;chống lại&#39; người l&agrave;m bạn kh&oacute;c, kẻ khiến bạn đau l&ograve;ng. N&ecirc;n nhớ, bạn lu&ocirc;n xứng đ&aacute;ng c&oacute; được một t&igrave;nh y&ecirc;u ngọt ng&agrave;o, xứng đ&aacute;ng được chở che, thương y&ecirc;u, chứ kh&ocirc;ng phải để ủ dột, buồn b&atilde; qua những th&aacute;ng năm tươi đẹp của tuổi thanh xu&acirc;n.</p>

<p>Th&ocirc;i th&igrave;, t&igrave;nh y&ecirc;u đ&ocirc;i khi chỉ l&agrave; một tr&ograve; chơi của tuổi trẻ, nếu thua cuộc, h&atilde;y can đảm m&agrave; sống tiếp, rồi sẽ c&oacute; ho&agrave;ng tử xem ch&uacute;ng ta l&agrave; c&ocirc;ng ch&uacute;a để m&agrave; n&acirc;ng niu v&agrave; y&ecirc;u thương suốt đời th&ocirc;i, l&uacute;c đ&oacute; cất đi những c&aacute;i gai kia cũng được!</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 0, 1, NULL)
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (19, N'Này con gái, khi yêu ai hãy giấu sẵn những cái gai để tự bảo vệ mình', N'<p><strong>Đừng hiền l&agrave;nh qu&aacute;, cũng đừng y&ecirc;u ai nhiều qu&aacute; đến nỗi qu&ecirc;n đi bản th&acirc;n m&igrave;nh. Khi y&ecirc;u ai d&ugrave;ng tr&aacute;i tim nhiều một t&iacute; cũng được, nhưng cũng n&ecirc;n giấu sẵn v&agrave;i c&aacute;i gai, nếu ai l&agrave;m bạn đau, h&atilde;y tự bảo vệ m&igrave;nh.</strong></p>

<p>&nbsp;</p>
', N'<p>T&ocirc;i thường thấy c&aacute;c c&ocirc; g&aacute;i c&agrave;ng hiền l&agrave;nh, c&agrave;ng ngoan ngo&atilde;n, c&agrave;ng yếu đuối th&igrave; lại c&agrave;ng lụy t&igrave;nh. T&igrave;nh y&ecirc;u l&agrave; tr&ograve; chơi c&uacute;t bắt của tuổi trẻ, người may mắn th&igrave; thắng cuộc, c&ograve;n hầu hết ch&uacute;ng ta đều thua. L&agrave; con g&aacute;i, đừng cứ đơn giản nghĩ chỉ cần m&igrave;nh tốt v&agrave; nhiệt th&agrave;nh với anh ta, th&igrave; anh ta sẽ lu&ocirc;n đối xử tốt với m&igrave;nh. Tất nhi&ecirc;n anh ấy sẽ tốt với bạn, y&ecirc;u thương bạn nhưng đi qua thời gian, chẳng ai d&aacute;m chắc điều n&agrave;y tồn tại vĩnh viễn.</p>

<p>T&ocirc;i c&oacute; quen một v&agrave;i c&ocirc; g&aacute;i như thế n&agrave;y. C&aacute;c c&ocirc; ấy xem t&igrave;nh y&ecirc;u l&agrave; sinh mệnh, trao đi tất cả những thứ tốt đẹp nhất trong tay cho một anh ch&agrave;ng. Họ rất hiền l&agrave;nh, rất xinh, rất đảm đang, rất ho&agrave;n hảo, ai cũng nghĩ những anh ch&agrave;ng kia thật may mắn. Ai cũng nghĩ những c&ocirc; bạn kia cả đời n&agrave;y sẽ chẳng c&ograve;n phải lo c&oacute; được y&ecirc;u thương chiều chuộng hay kh&ocirc;ng.</p>

<p>Thế rồi đ&ugrave;ng c&aacute;i một ng&agrave;y, mấy c&ocirc; g&aacute;i xinh đẹp kia gặp t&ocirc;i với một đ&ocirc;i mắt sưng h&uacute;p. C&oacute; người kh&oacute;c l&oacute;c bảo t&igrave;nh y&ecirc;u kh&ocirc;ng như &yacute; muốn, anh ấy hết lần n&agrave;y đến lượt kh&aacute;c l&agrave;m c&ocirc; đau khổ. N&agrave;o ngoại t&igrave;nh, n&agrave;o y&ecirc;u l&eacute;n l&uacute;t người kh&aacute;c, biến c&ocirc; trở th&agrave;nh người thứ ba. Đến người kh&aacute;c th&igrave; suốt ng&agrave;y b&ecirc; tha, đ&aacute;nh đập c&ocirc; đủ kiểu, tr&ecirc;n người l&uacute;c n&agrave;o cũng v&agrave;i vết t&iacute;m bầm. C&oacute; c&ocirc; chẳng v&igrave; l&yacute; do n&agrave;o cả, chỉ v&igrave; hắn ta bảo kh&ocirc;ng c&ograve;n y&ecirc;u c&ocirc;, muốn chia tay.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/con-gai-luon-cuoi.jpg" /></p>

<p>Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do. Ảnh minh họa.</p>

<p>Chuyện t&igrave;nh y&ecirc;u n&agrave;o ai biết trước được những điều sẽ xảy ra. T&ocirc;i chỉ khuy&ecirc;n c&aacute;c c&ocirc; rằng, ở trong thời đại n&agrave;y, đừng y&ecirc;u ai đến nỗi khiến bản th&acirc;n m&igrave;nh quỵ lụy. H&atilde;y t&iacute;ch lũy cho m&igrave;nh thật nhiều bản lĩnh, thật nhiều dũng cảm, mạnh mẽ, để khi chia tay rồi, kh&ocirc;ng c&ograve;n ai để yếu đuối, nương tựa th&igrave; bản th&acirc;n vẫn phải vững v&agrave;ng để bước tiếp, chiến đấu với cuộc đời.</p>

<p>Đừng bao giờ quỵ lụy với một người đ&agrave;n &ocirc;ng kh&ocirc;ng mang lại cho m&igrave;nh hạnh ph&uacute;c. Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do.</p>

<p>Bản th&acirc;n ch&uacute;ng ta l&agrave; những c&ocirc; g&aacute;i khi y&ecirc;u thường qu&ecirc;n mất mọi thứ xung quanh, cuộc sống của ch&uacute;ng ta chỉ biết xoay người ấy, để rồi khi người ta kh&ocirc;ng c&ograve;n ở lại nữa th&igrave; cảm thấy bầu trời kh&ocirc;ng trong xanh, cơm ăn kh&ocirc;ng ngon, cười kh&ocirc;ng hạnh ph&uacute;c. Bởi thế, những c&ocirc; g&aacute;i khi y&ecirc;u n&ecirc;n giấu sẵn những c&aacute;i gai trong người, để l&uacute;c cần tỉnh t&aacute;o h&atilde;y tỉnh t&aacute;o v&agrave; sẵn s&agrave;ng lao v&agrave;o &lsquo;chống lại&#39; người l&agrave;m bạn kh&oacute;c, kẻ khiến bạn đau l&ograve;ng. N&ecirc;n nhớ, bạn lu&ocirc;n xứng đ&aacute;ng c&oacute; được một t&igrave;nh y&ecirc;u ngọt ng&agrave;o, xứng đ&aacute;ng được chở che, thương y&ecirc;u, chứ kh&ocirc;ng phải để ủ dột, buồn b&atilde; qua những th&aacute;ng năm tươi đẹp của tuổi thanh xu&acirc;n.</p>

<p>Th&ocirc;i th&igrave;, t&igrave;nh y&ecirc;u đ&ocirc;i khi chỉ l&agrave; một tr&ograve; chơi của tuổi trẻ, nếu thua cuộc, h&atilde;y can đảm m&agrave; sống tiếp, rồi sẽ c&oacute; ho&agrave;ng tử xem ch&uacute;ng ta l&agrave; c&ocirc;ng ch&uacute;a để m&agrave; n&acirc;ng niu v&agrave; y&ecirc;u thương suốt đời th&ocirc;i, l&uacute;c đ&oacute; cất đi những c&aacute;i gai kia cũng được!</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 0, 1, N'/asset/client/Audio_Video/Audio/TinTuc/Nhu-Ngay-Hom-Qua-Son-Tung-M-TP.mp3')
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (20, N'Này con gái, khi yêu ai hãy giấu sẵn những cái gai để tự bảo vệ mình', N'<p>Đừng hiền l&agrave;nh qu&aacute;, cũng đừng y&ecirc;u ai nhiều qu&aacute; đến nỗi qu&ecirc;n đi bản th&acirc;n m&igrave;nh. Khi y&ecirc;u ai d&ugrave;ng tr&aacute;i tim nhiều một t&iacute; cũng được, nhưng cũng n&ecirc;n giấu sẵn v&agrave;i c&aacute;i gai, nếu ai l&agrave;m bạn đau, h&atilde;y tự bảo vệ m&igrave;nh.</p>

<p>&nbsp;</p>
', N'<p>T&ocirc;i thường thấy c&aacute;c c&ocirc; g&aacute;i c&agrave;ng hiền l&agrave;nh, c&agrave;ng ngoan ngo&atilde;n, c&agrave;ng yếu đuối th&igrave; lại c&agrave;ng lụy t&igrave;nh. T&igrave;nh y&ecirc;u l&agrave; tr&ograve; chơi c&uacute;t bắt của tuổi trẻ, người may mắn th&igrave; thắng cuộc, c&ograve;n hầu hết ch&uacute;ng ta đều thua. L&agrave; con g&aacute;i, đừng cứ đơn giản nghĩ chỉ cần m&igrave;nh tốt v&agrave; nhiệt th&agrave;nh với anh ta, th&igrave; anh ta sẽ lu&ocirc;n đối xử tốt với m&igrave;nh. Tất nhi&ecirc;n anh ấy sẽ tốt với bạn, y&ecirc;u thương bạn nhưng đi qua thời gian, chẳng ai d&aacute;m chắc điều n&agrave;y tồn tại vĩnh viễn.</p>

<p>T&ocirc;i c&oacute; quen một v&agrave;i c&ocirc; g&aacute;i như thế n&agrave;y. C&aacute;c c&ocirc; ấy xem t&igrave;nh y&ecirc;u l&agrave; sinh mệnh, trao đi tất cả những thứ tốt đẹp nhất trong tay cho một anh ch&agrave;ng. Họ rất hiền l&agrave;nh, rất xinh, rất đảm đang, rất ho&agrave;n hảo, ai cũng nghĩ những anh ch&agrave;ng kia thật may mắn. Ai cũng nghĩ những c&ocirc; bạn kia cả đời n&agrave;y sẽ chẳng c&ograve;n phải lo c&oacute; được y&ecirc;u thương chiều chuộng hay kh&ocirc;ng.</p>

<p>Thế rồi đ&ugrave;ng c&aacute;i một ng&agrave;y, mấy c&ocirc; g&aacute;i xinh đẹp kia gặp t&ocirc;i với một đ&ocirc;i mắt sưng h&uacute;p. C&oacute; người kh&oacute;c l&oacute;c bảo t&igrave;nh y&ecirc;u kh&ocirc;ng như &yacute; muốn, anh ấy hết lần n&agrave;y đến lượt kh&aacute;c l&agrave;m c&ocirc; đau khổ. N&agrave;o ngoại t&igrave;nh, n&agrave;o y&ecirc;u l&eacute;n l&uacute;t người kh&aacute;c, biến c&ocirc; trở th&agrave;nh người thứ ba. Đến người kh&aacute;c th&igrave; suốt ng&agrave;y b&ecirc; tha, đ&aacute;nh đập c&ocirc; đủ kiểu, tr&ecirc;n người l&uacute;c n&agrave;o cũng v&agrave;i vết t&iacute;m bầm. C&oacute; c&ocirc; chẳng v&igrave; l&yacute; do n&agrave;o cả, chỉ v&igrave; hắn ta bảo kh&ocirc;ng c&ograve;n y&ecirc;u c&ocirc;, muốn chia tay.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/con-gai-luon-cuoi.jpg" /></p>

<p>Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do. Ảnh minh họa.</p>

<p>Chuyện t&igrave;nh y&ecirc;u n&agrave;o ai biết trước được những điều sẽ xảy ra. T&ocirc;i chỉ khuy&ecirc;n c&aacute;c c&ocirc; rằng, ở trong thời đại n&agrave;y, đừng y&ecirc;u ai đến nỗi khiến bản th&acirc;n m&igrave;nh quỵ lụy. H&atilde;y t&iacute;ch lũy cho m&igrave;nh thật nhiều bản lĩnh, thật nhiều dũng cảm, mạnh mẽ, để khi chia tay rồi, kh&ocirc;ng c&ograve;n ai để yếu đuối, nương tựa th&igrave; bản th&acirc;n vẫn phải vững v&agrave;ng để bước tiếp, chiến đấu với cuộc đời.</p>

<p>Đừng bao giờ quỵ lụy với một người đ&agrave;n &ocirc;ng kh&ocirc;ng mang lại cho m&igrave;nh hạnh ph&uacute;c. Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do.</p>

<p>Bản th&acirc;n ch&uacute;ng ta l&agrave; những c&ocirc; g&aacute;i khi y&ecirc;u thường qu&ecirc;n mất mọi thứ xung quanh, cuộc sống của ch&uacute;ng ta chỉ biết xoay người ấy, để rồi khi người ta kh&ocirc;ng c&ograve;n ở lại nữa th&igrave; cảm thấy bầu trời kh&ocirc;ng trong xanh, cơm ăn kh&ocirc;ng ngon, cười kh&ocirc;ng hạnh ph&uacute;c. Bởi thế, những c&ocirc; g&aacute;i khi y&ecirc;u n&ecirc;n giấu sẵn những c&aacute;i gai trong người, để l&uacute;c cần tỉnh t&aacute;o h&atilde;y tỉnh t&aacute;o v&agrave; sẵn s&agrave;ng lao v&agrave;o &lsquo;chống lại&#39; người l&agrave;m bạn kh&oacute;c, kẻ khiến bạn đau l&ograve;ng. N&ecirc;n nhớ, bạn lu&ocirc;n xứng đ&aacute;ng c&oacute; được một t&igrave;nh y&ecirc;u ngọt ng&agrave;o, xứng đ&aacute;ng được chở che, thương y&ecirc;u, chứ kh&ocirc;ng phải để ủ dột, buồn b&atilde; qua những th&aacute;ng năm tươi đẹp của tuổi thanh xu&acirc;n.</p>

<p>Th&ocirc;i th&igrave;, t&igrave;nh y&ecirc;u đ&ocirc;i khi chỉ l&agrave; một tr&ograve; chơi của tuổi trẻ, nếu thua cuộc, h&atilde;y can đảm m&agrave; sống tiếp, rồi sẽ c&oacute; ho&agrave;ng tử xem ch&uacute;ng ta l&agrave; c&ocirc;ng ch&uacute;a để m&agrave; n&acirc;ng niu v&agrave; y&ecirc;u thương suốt đời th&ocirc;i, l&uacute;c đ&oacute; cất đi những c&aacute;i gai kia cũng được!</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 0, 1, NULL)
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (21, N'Này con gái, khi yêu ai hãy giấu sẵn những cái gai để tự bảo vệ mình', N'<p>Đừng hiền l&agrave;nh qu&aacute;, cũng đừng y&ecirc;u ai nhiều qu&aacute; đến nỗi qu&ecirc;n đi bản th&acirc;n m&igrave;nh. Khi y&ecirc;u ai d&ugrave;ng tr&aacute;i tim nhiều một t&iacute; cũng được, nhưng cũng n&ecirc;n giấu sẵn v&agrave;i c&aacute;i gai, nếu ai l&agrave;m bạn đau, h&atilde;y tự bảo vệ m&igrave;nh.</p>

<p>&nbsp;</p>
', N'<p>T&ocirc;i thường thấy c&aacute;c c&ocirc; g&aacute;i c&agrave;ng hiền l&agrave;nh, c&agrave;ng ngoan ngo&atilde;n, c&agrave;ng yếu đuối th&igrave; lại c&agrave;ng lụy t&igrave;nh. T&igrave;nh y&ecirc;u l&agrave; tr&ograve; chơi c&uacute;t bắt của tuổi trẻ, người may mắn th&igrave; thắng cuộc, c&ograve;n hầu hết ch&uacute;ng ta đều thua. L&agrave; con g&aacute;i, đừng cứ đơn giản nghĩ chỉ cần m&igrave;nh tốt v&agrave; nhiệt th&agrave;nh với anh ta, th&igrave; anh ta sẽ lu&ocirc;n đối xử tốt với m&igrave;nh. Tất nhi&ecirc;n anh ấy sẽ tốt với bạn, y&ecirc;u thương bạn nhưng đi qua thời gian, chẳng ai d&aacute;m chắc điều n&agrave;y tồn tại vĩnh viễn.</p>

<p>T&ocirc;i c&oacute; quen một v&agrave;i c&ocirc; g&aacute;i như thế n&agrave;y. C&aacute;c c&ocirc; ấy xem t&igrave;nh y&ecirc;u l&agrave; sinh mệnh, trao đi tất cả những thứ tốt đẹp nhất trong tay cho một anh ch&agrave;ng. Họ rất hiền l&agrave;nh, rất xinh, rất đảm đang, rất ho&agrave;n hảo, ai cũng nghĩ những anh ch&agrave;ng kia thật may mắn. Ai cũng nghĩ những c&ocirc; bạn kia cả đời n&agrave;y sẽ chẳng c&ograve;n phải lo c&oacute; được y&ecirc;u thương chiều chuộng hay kh&ocirc;ng.</p>

<p>Thế rồi đ&ugrave;ng c&aacute;i một ng&agrave;y, mấy c&ocirc; g&aacute;i xinh đẹp kia gặp t&ocirc;i với một đ&ocirc;i mắt sưng h&uacute;p. C&oacute; người kh&oacute;c l&oacute;c bảo t&igrave;nh y&ecirc;u kh&ocirc;ng như &yacute; muốn, anh ấy hết lần n&agrave;y đến lượt kh&aacute;c l&agrave;m c&ocirc; đau khổ. N&agrave;o ngoại t&igrave;nh, n&agrave;o y&ecirc;u l&eacute;n l&uacute;t người kh&aacute;c, biến c&ocirc; trở th&agrave;nh người thứ ba. Đến người kh&aacute;c th&igrave; suốt ng&agrave;y b&ecirc; tha, đ&aacute;nh đập c&ocirc; đủ kiểu, tr&ecirc;n người l&uacute;c n&agrave;o cũng v&agrave;i vết t&iacute;m bầm. C&oacute; c&ocirc; chẳng v&igrave; l&yacute; do n&agrave;o cả, chỉ v&igrave; hắn ta bảo kh&ocirc;ng c&ograve;n y&ecirc;u c&ocirc;, muốn chia tay.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/con-gai-luon-cuoi.jpg" /></p>

<p>Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do. Ảnh minh họa.</p>

<p>Chuyện t&igrave;nh y&ecirc;u n&agrave;o ai biết trước được những điều sẽ xảy ra. T&ocirc;i chỉ khuy&ecirc;n c&aacute;c c&ocirc; rằng, ở trong thời đại n&agrave;y, đừng y&ecirc;u ai đến nỗi khiến bản th&acirc;n m&igrave;nh quỵ lụy. H&atilde;y t&iacute;ch lũy cho m&igrave;nh thật nhiều bản lĩnh, thật nhiều dũng cảm, mạnh mẽ, để khi chia tay rồi, kh&ocirc;ng c&ograve;n ai để yếu đuối, nương tựa th&igrave; bản th&acirc;n vẫn phải vững v&agrave;ng để bước tiếp, chiến đấu với cuộc đời.</p>

<p>Đừng bao giờ quỵ lụy với một người đ&agrave;n &ocirc;ng kh&ocirc;ng mang lại cho m&igrave;nh hạnh ph&uacute;c. Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do.</p>

<p>Bản th&acirc;n ch&uacute;ng ta l&agrave; những c&ocirc; g&aacute;i khi y&ecirc;u thường qu&ecirc;n mất mọi thứ xung quanh, cuộc sống của ch&uacute;ng ta chỉ biết xoay người ấy, để rồi khi người ta kh&ocirc;ng c&ograve;n ở lại nữa th&igrave; cảm thấy bầu trời kh&ocirc;ng trong xanh, cơm ăn kh&ocirc;ng ngon, cười kh&ocirc;ng hạnh ph&uacute;c. Bởi thế, những c&ocirc; g&aacute;i khi y&ecirc;u n&ecirc;n giấu sẵn những c&aacute;i gai trong người, để l&uacute;c cần tỉnh t&aacute;o h&atilde;y tỉnh t&aacute;o v&agrave; sẵn s&agrave;ng lao v&agrave;o &lsquo;chống lại&#39; người l&agrave;m bạn kh&oacute;c, kẻ khiến bạn đau l&ograve;ng. N&ecirc;n nhớ, bạn lu&ocirc;n xứng đ&aacute;ng c&oacute; được một t&igrave;nh y&ecirc;u ngọt ng&agrave;o, xứng đ&aacute;ng được chở che, thương y&ecirc;u, chứ kh&ocirc;ng phải để ủ dột, buồn b&atilde; qua những th&aacute;ng năm tươi đẹp của tuổi thanh xu&acirc;n.</p>

<p>Th&ocirc;i th&igrave;, t&igrave;nh y&ecirc;u đ&ocirc;i khi chỉ l&agrave; một tr&ograve; chơi của tuổi trẻ, nếu thua cuộc, h&atilde;y can đảm m&agrave; sống tiếp, rồi sẽ c&oacute; ho&agrave;ng tử xem ch&uacute;ng ta l&agrave; c&ocirc;ng ch&uacute;a để m&agrave; n&acirc;ng niu v&agrave; y&ecirc;u thương suốt đời th&ocirc;i, l&uacute;c đ&oacute; cất đi những c&aacute;i gai kia cũng được!</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 0, 1, NULL)
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (22, N'Này con gái, khi yêu ai hãy giấu sẵn những cái gai để tự bảo vệ mình', N'<p>Đừng hiền l&agrave;nh qu&aacute;, cũng đừng y&ecirc;u ai nhiều qu&aacute; đến nỗi qu&ecirc;n đi bản th&acirc;n m&igrave;nh. Khi y&ecirc;u ai d&ugrave;ng tr&aacute;i tim nhiều một t&iacute; cũng được, nhưng cũng n&ecirc;n giấu sẵn v&agrave;i c&aacute;i gai, nếu ai l&agrave;m bạn đau, h&atilde;y tự bảo vệ m&igrave;nh.</p>

<p>&nbsp;</p>
', N'<p>T&ocirc;i thường thấy c&aacute;c c&ocirc; g&aacute;i c&agrave;ng hiền l&agrave;nh, c&agrave;ng ngoan ngo&atilde;n, c&agrave;ng yếu đuối th&igrave; lại c&agrave;ng lụy t&igrave;nh. T&igrave;nh y&ecirc;u l&agrave; tr&ograve; chơi c&uacute;t bắt của tuổi trẻ, người may mắn th&igrave; thắng cuộc, c&ograve;n hầu hết ch&uacute;ng ta đều thua. L&agrave; con g&aacute;i, đừng cứ đơn giản nghĩ chỉ cần m&igrave;nh tốt v&agrave; nhiệt th&agrave;nh với anh ta, th&igrave; anh ta sẽ lu&ocirc;n đối xử tốt với m&igrave;nh. Tất nhi&ecirc;n anh ấy sẽ tốt với bạn, y&ecirc;u thương bạn nhưng đi qua thời gian, chẳng ai d&aacute;m chắc điều n&agrave;y tồn tại vĩnh viễn.</p>

<p>T&ocirc;i c&oacute; quen một v&agrave;i c&ocirc; g&aacute;i như thế n&agrave;y. C&aacute;c c&ocirc; ấy xem t&igrave;nh y&ecirc;u l&agrave; sinh mệnh, trao đi tất cả những thứ tốt đẹp nhất trong tay cho một anh ch&agrave;ng. Họ rất hiền l&agrave;nh, rất xinh, rất đảm đang, rất ho&agrave;n hảo, ai cũng nghĩ những anh ch&agrave;ng kia thật may mắn. Ai cũng nghĩ những c&ocirc; bạn kia cả đời n&agrave;y sẽ chẳng c&ograve;n phải lo c&oacute; được y&ecirc;u thương chiều chuộng hay kh&ocirc;ng.</p>

<p>Thế rồi đ&ugrave;ng c&aacute;i một ng&agrave;y, mấy c&ocirc; g&aacute;i xinh đẹp kia gặp t&ocirc;i với một đ&ocirc;i mắt sưng h&uacute;p. C&oacute; người kh&oacute;c l&oacute;c bảo t&igrave;nh y&ecirc;u kh&ocirc;ng như &yacute; muốn, anh ấy hết lần n&agrave;y đến lượt kh&aacute;c l&agrave;m c&ocirc; đau khổ. N&agrave;o ngoại t&igrave;nh, n&agrave;o y&ecirc;u l&eacute;n l&uacute;t người kh&aacute;c, biến c&ocirc; trở th&agrave;nh người thứ ba. Đến người kh&aacute;c th&igrave; suốt ng&agrave;y b&ecirc; tha, đ&aacute;nh đập c&ocirc; đủ kiểu, tr&ecirc;n người l&uacute;c n&agrave;o cũng v&agrave;i vết t&iacute;m bầm. C&oacute; c&ocirc; chẳng v&igrave; l&yacute; do n&agrave;o cả, chỉ v&igrave; hắn ta bảo kh&ocirc;ng c&ograve;n y&ecirc;u c&ocirc;, muốn chia tay.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/con-gai-luon-cuoi.jpg" /></p>

<p>Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do. Ảnh minh họa.</p>

<p>Chuyện t&igrave;nh y&ecirc;u n&agrave;o ai biết trước được những điều sẽ xảy ra. T&ocirc;i chỉ khuy&ecirc;n c&aacute;c c&ocirc; rằng, ở trong thời đại n&agrave;y, đừng y&ecirc;u ai đến nỗi khiến bản th&acirc;n m&igrave;nh quỵ lụy. H&atilde;y t&iacute;ch lũy cho m&igrave;nh thật nhiều bản lĩnh, thật nhiều dũng cảm, mạnh mẽ, để khi chia tay rồi, kh&ocirc;ng c&ograve;n ai để yếu đuối, nương tựa th&igrave; bản th&acirc;n vẫn phải vững v&agrave;ng để bước tiếp, chiến đấu với cuộc đời.</p>

<p>Đừng bao giờ quỵ lụy với một người đ&agrave;n &ocirc;ng kh&ocirc;ng mang lại cho m&igrave;nh hạnh ph&uacute;c. Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do.</p>

<p>Bản th&acirc;n ch&uacute;ng ta l&agrave; những c&ocirc; g&aacute;i khi y&ecirc;u thường qu&ecirc;n mất mọi thứ xung quanh, cuộc sống của ch&uacute;ng ta chỉ biết xoay người ấy, để rồi khi người ta kh&ocirc;ng c&ograve;n ở lại nữa th&igrave; cảm thấy bầu trời kh&ocirc;ng trong xanh, cơm ăn kh&ocirc;ng ngon, cười kh&ocirc;ng hạnh ph&uacute;c. Bởi thế, những c&ocirc; g&aacute;i khi y&ecirc;u n&ecirc;n giấu sẵn những c&aacute;i gai trong người, để l&uacute;c cần tỉnh t&aacute;o h&atilde;y tỉnh t&aacute;o v&agrave; sẵn s&agrave;ng lao v&agrave;o &lsquo;chống lại&#39; người l&agrave;m bạn kh&oacute;c, kẻ khiến bạn đau l&ograve;ng. N&ecirc;n nhớ, bạn lu&ocirc;n xứng đ&aacute;ng c&oacute; được một t&igrave;nh y&ecirc;u ngọt ng&agrave;o, xứng đ&aacute;ng được chở che, thương y&ecirc;u, chứ kh&ocirc;ng phải để ủ dột, buồn b&atilde; qua những th&aacute;ng năm tươi đẹp của tuổi thanh xu&acirc;n.</p>

<p>Th&ocirc;i th&igrave;, t&igrave;nh y&ecirc;u đ&ocirc;i khi chỉ l&agrave; một tr&ograve; chơi của tuổi trẻ, nếu thua cuộc, h&atilde;y can đảm m&agrave; sống tiếp, rồi sẽ c&oacute; ho&agrave;ng tử xem ch&uacute;ng ta l&agrave; c&ocirc;ng ch&uacute;a để m&agrave; n&acirc;ng niu v&agrave; y&ecirc;u thương suốt đời th&ocirc;i, l&uacute;c đ&oacute; cất đi những c&aacute;i gai kia cũng được!</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 0, 1, NULL)
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (23, N'Này con gái, khi yêu ai hãy giấu sẵn những cái gai để tự bảo vệ mình', N'<p><strong>Đừng hiền l&agrave;nh qu&aacute;, cũng đừng y&ecirc;u ai nhiều qu&aacute; đến nỗi qu&ecirc;n đi bản th&acirc;n m&igrave;nh. Khi y&ecirc;u ai d&ugrave;ng tr&aacute;i tim nhiều một t&iacute; cũng được, nhưng cũng n&ecirc;n giấu sẵn v&agrave;i c&aacute;i gai, nếu ai l&agrave;m bạn đau, h&atilde;y tự bảo vệ m&igrave;nh.</strong></p>

<p>&nbsp;</p>
', N'<p>T&ocirc;i thường thấy c&aacute;c c&ocirc; g&aacute;i c&agrave;ng hiền l&agrave;nh, c&agrave;ng ngoan ngo&atilde;n, c&agrave;ng yếu đuối th&igrave; lại c&agrave;ng lụy t&igrave;nh. T&igrave;nh y&ecirc;u l&agrave; tr&ograve; chơi c&uacute;t bắt của tuổi trẻ, người may mắn th&igrave; thắng cuộc, c&ograve;n hầu hết ch&uacute;ng ta đều thua. L&agrave; con g&aacute;i, đừng cứ đơn giản nghĩ chỉ cần m&igrave;nh tốt v&agrave; nhiệt th&agrave;nh với anh ta, th&igrave; anh ta sẽ lu&ocirc;n đối xử tốt với m&igrave;nh. Tất nhi&ecirc;n anh ấy sẽ tốt với bạn, y&ecirc;u thương bạn nhưng đi qua thời gian, chẳng ai d&aacute;m chắc điều n&agrave;y tồn tại vĩnh viễn.</p>

<p>T&ocirc;i c&oacute; quen một v&agrave;i c&ocirc; g&aacute;i như thế n&agrave;y. C&aacute;c c&ocirc; ấy xem t&igrave;nh y&ecirc;u l&agrave; sinh mệnh, trao đi tất cả những thứ tốt đẹp nhất trong tay cho một anh ch&agrave;ng. Họ rất hiền l&agrave;nh, rất xinh, rất đảm đang, rất ho&agrave;n hảo, ai cũng nghĩ những anh ch&agrave;ng kia thật may mắn. Ai cũng nghĩ những c&ocirc; bạn kia cả đời n&agrave;y sẽ chẳng c&ograve;n phải lo c&oacute; được y&ecirc;u thương chiều chuộng hay kh&ocirc;ng.</p>

<p>Thế rồi đ&ugrave;ng c&aacute;i một ng&agrave;y, mấy c&ocirc; g&aacute;i xinh đẹp kia gặp t&ocirc;i với một đ&ocirc;i mắt sưng h&uacute;p. C&oacute; người kh&oacute;c l&oacute;c bảo t&igrave;nh y&ecirc;u kh&ocirc;ng như &yacute; muốn, anh ấy hết lần n&agrave;y đến lượt kh&aacute;c l&agrave;m c&ocirc; đau khổ. N&agrave;o ngoại t&igrave;nh, n&agrave;o y&ecirc;u l&eacute;n l&uacute;t người kh&aacute;c, biến c&ocirc; trở th&agrave;nh người thứ ba. Đến người kh&aacute;c th&igrave; suốt ng&agrave;y b&ecirc; tha, đ&aacute;nh đập c&ocirc; đủ kiểu, tr&ecirc;n người l&uacute;c n&agrave;o cũng v&agrave;i vết t&iacute;m bầm. C&oacute; c&ocirc; chẳng v&igrave; l&yacute; do n&agrave;o cả, chỉ v&igrave; hắn ta bảo kh&ocirc;ng c&ograve;n y&ecirc;u c&ocirc;, muốn chia tay.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/con-gai-luon-cuoi.jpg" /></p>

<p>Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do. Ảnh minh họa.</p>

<p>Chuyện t&igrave;nh y&ecirc;u n&agrave;o ai biết trước được những điều sẽ xảy ra. T&ocirc;i chỉ khuy&ecirc;n c&aacute;c c&ocirc; rằng, ở trong thời đại n&agrave;y, đừng y&ecirc;u ai đến nỗi khiến bản th&acirc;n m&igrave;nh quỵ lụy. H&atilde;y t&iacute;ch lũy cho m&igrave;nh thật nhiều bản lĩnh, thật nhiều dũng cảm, mạnh mẽ, để khi chia tay rồi, kh&ocirc;ng c&ograve;n ai để yếu đuối, nương tựa th&igrave; bản th&acirc;n vẫn phải vững v&agrave;ng để bước tiếp, chiến đấu với cuộc đời.</p>

<p>Đừng bao giờ quỵ lụy với một người đ&agrave;n &ocirc;ng kh&ocirc;ng mang lại cho m&igrave;nh hạnh ph&uacute;c. Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do.</p>

<p>Bản th&acirc;n ch&uacute;ng ta l&agrave; những c&ocirc; g&aacute;i khi y&ecirc;u thường qu&ecirc;n mất mọi thứ xung quanh, cuộc sống của ch&uacute;ng ta chỉ biết xoay người ấy, để rồi khi người ta kh&ocirc;ng c&ograve;n ở lại nữa th&igrave; cảm thấy bầu trời kh&ocirc;ng trong xanh, cơm ăn kh&ocirc;ng ngon, cười kh&ocirc;ng hạnh ph&uacute;c. Bởi thế, những c&ocirc; g&aacute;i khi y&ecirc;u n&ecirc;n giấu sẵn những c&aacute;i gai trong người, để l&uacute;c cần tỉnh t&aacute;o h&atilde;y tỉnh t&aacute;o v&agrave; sẵn s&agrave;ng lao v&agrave;o &lsquo;chống lại&#39; người l&agrave;m bạn kh&oacute;c, kẻ khiến bạn đau l&ograve;ng. N&ecirc;n nhớ, bạn lu&ocirc;n xứng đ&aacute;ng c&oacute; được một t&igrave;nh y&ecirc;u ngọt ng&agrave;o, xứng đ&aacute;ng được chở che, thương y&ecirc;u, chứ kh&ocirc;ng phải để ủ dột, buồn b&atilde; qua những th&aacute;ng năm tươi đẹp của tuổi thanh xu&acirc;n.</p>

<p>Th&ocirc;i th&igrave;, t&igrave;nh y&ecirc;u đ&ocirc;i khi chỉ l&agrave; một tr&ograve; chơi của tuổi trẻ, nếu thua cuộc, h&atilde;y can đảm m&agrave; sống tiếp, rồi sẽ c&oacute; ho&agrave;ng tử xem ch&uacute;ng ta l&agrave; c&ocirc;ng ch&uacute;a để m&agrave; n&acirc;ng niu v&agrave; y&ecirc;u thương suốt đời th&ocirc;i, l&uacute;c đ&oacute; cất đi những c&aacute;i gai kia cũng được!</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 0, 1, N'/asset/client/Audio_Video/Audio/TinTuc/Nhu-Ngay-Hom-Qua-Son-Tung-M-TP.mp3')
INSERT [dbo].[tbl_TinTuc] ([Id], [TieuDe], [TomTat], [NoiDung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active], [Url_BaiHat]) VALUES (24, N'Này con gái, khi yêu ai hãy giấu sẵn những cái gai để tự bảo vệ mình', N'<p>Đừng hiền l&agrave;nh qu&aacute;, cũng đừng y&ecirc;u ai nhiều qu&aacute; đến nỗi qu&ecirc;n đi bản th&acirc;n m&igrave;nh. Khi y&ecirc;u ai d&ugrave;ng tr&aacute;i tim nhiều một t&iacute; cũng được, nhưng cũng n&ecirc;n giấu sẵn v&agrave;i c&aacute;i gai, nếu ai l&agrave;m bạn đau, h&atilde;y tự bảo vệ m&igrave;nh.</p>

<p>&nbsp;</p>
', N'<p>T&ocirc;i thường thấy c&aacute;c c&ocirc; g&aacute;i c&agrave;ng hiền l&agrave;nh, c&agrave;ng ngoan ngo&atilde;n, c&agrave;ng yếu đuối th&igrave; lại c&agrave;ng lụy t&igrave;nh. T&igrave;nh y&ecirc;u l&agrave; tr&ograve; chơi c&uacute;t bắt của tuổi trẻ, người may mắn th&igrave; thắng cuộc, c&ograve;n hầu hết ch&uacute;ng ta đều thua. L&agrave; con g&aacute;i, đừng cứ đơn giản nghĩ chỉ cần m&igrave;nh tốt v&agrave; nhiệt th&agrave;nh với anh ta, th&igrave; anh ta sẽ lu&ocirc;n đối xử tốt với m&igrave;nh. Tất nhi&ecirc;n anh ấy sẽ tốt với bạn, y&ecirc;u thương bạn nhưng đi qua thời gian, chẳng ai d&aacute;m chắc điều n&agrave;y tồn tại vĩnh viễn.</p>

<p>T&ocirc;i c&oacute; quen một v&agrave;i c&ocirc; g&aacute;i như thế n&agrave;y. C&aacute;c c&ocirc; ấy xem t&igrave;nh y&ecirc;u l&agrave; sinh mệnh, trao đi tất cả những thứ tốt đẹp nhất trong tay cho một anh ch&agrave;ng. Họ rất hiền l&agrave;nh, rất xinh, rất đảm đang, rất ho&agrave;n hảo, ai cũng nghĩ những anh ch&agrave;ng kia thật may mắn. Ai cũng nghĩ những c&ocirc; bạn kia cả đời n&agrave;y sẽ chẳng c&ograve;n phải lo c&oacute; được y&ecirc;u thương chiều chuộng hay kh&ocirc;ng.</p>

<p>Thế rồi đ&ugrave;ng c&aacute;i một ng&agrave;y, mấy c&ocirc; g&aacute;i xinh đẹp kia gặp t&ocirc;i với một đ&ocirc;i mắt sưng h&uacute;p. C&oacute; người kh&oacute;c l&oacute;c bảo t&igrave;nh y&ecirc;u kh&ocirc;ng như &yacute; muốn, anh ấy hết lần n&agrave;y đến lượt kh&aacute;c l&agrave;m c&ocirc; đau khổ. N&agrave;o ngoại t&igrave;nh, n&agrave;o y&ecirc;u l&eacute;n l&uacute;t người kh&aacute;c, biến c&ocirc; trở th&agrave;nh người thứ ba. Đến người kh&aacute;c th&igrave; suốt ng&agrave;y b&ecirc; tha, đ&aacute;nh đập c&ocirc; đủ kiểu, tr&ecirc;n người l&uacute;c n&agrave;o cũng v&agrave;i vết t&iacute;m bầm. C&oacute; c&ocirc; chẳng v&igrave; l&yacute; do n&agrave;o cả, chỉ v&igrave; hắn ta bảo kh&ocirc;ng c&ograve;n y&ecirc;u c&ocirc;, muốn chia tay.</p>

<p><img alt="" src="http://keeng.vn/sata11/img/images/article/2016/2017/con-gai-luon-cuoi.jpg" /></p>

<p>Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do. Ảnh minh họa.</p>

<p>Chuyện t&igrave;nh y&ecirc;u n&agrave;o ai biết trước được những điều sẽ xảy ra. T&ocirc;i chỉ khuy&ecirc;n c&aacute;c c&ocirc; rằng, ở trong thời đại n&agrave;y, đừng y&ecirc;u ai đến nỗi khiến bản th&acirc;n m&igrave;nh quỵ lụy. H&atilde;y t&iacute;ch lũy cho m&igrave;nh thật nhiều bản lĩnh, thật nhiều dũng cảm, mạnh mẽ, để khi chia tay rồi, kh&ocirc;ng c&ograve;n ai để yếu đuối, nương tựa th&igrave; bản th&acirc;n vẫn phải vững v&agrave;ng để bước tiếp, chiến đấu với cuộc đời.</p>

<p>Đừng bao giờ quỵ lụy với một người đ&agrave;n &ocirc;ng kh&ocirc;ng mang lại cho m&igrave;nh hạnh ph&uacute;c. Đừng bao giờ cố n&iacute;u k&eacute;o, van xin t&igrave;nh y&ecirc;u của một người kh&ocirc;ng thương y&ecirc;u m&igrave;nh trọn vẹn. Nếu người đ&oacute; y&ecirc;u bạn, người ấy sẽ sẵn s&agrave;ng bảo vệ bạn, c&ograve;n kh&ocirc;ng, anh ta chỉ t&igrave;m l&yacute; do.</p>

<p>Bản th&acirc;n ch&uacute;ng ta l&agrave; những c&ocirc; g&aacute;i khi y&ecirc;u thường qu&ecirc;n mất mọi thứ xung quanh, cuộc sống của ch&uacute;ng ta chỉ biết xoay người ấy, để rồi khi người ta kh&ocirc;ng c&ograve;n ở lại nữa th&igrave; cảm thấy bầu trời kh&ocirc;ng trong xanh, cơm ăn kh&ocirc;ng ngon, cười kh&ocirc;ng hạnh ph&uacute;c. Bởi thế, những c&ocirc; g&aacute;i khi y&ecirc;u n&ecirc;n giấu sẵn những c&aacute;i gai trong người, để l&uacute;c cần tỉnh t&aacute;o h&atilde;y tỉnh t&aacute;o v&agrave; sẵn s&agrave;ng lao v&agrave;o &lsquo;chống lại&#39; người l&agrave;m bạn kh&oacute;c, kẻ khiến bạn đau l&ograve;ng. N&ecirc;n nhớ, bạn lu&ocirc;n xứng đ&aacute;ng c&oacute; được một t&igrave;nh y&ecirc;u ngọt ng&agrave;o, xứng đ&aacute;ng được chở che, thương y&ecirc;u, chứ kh&ocirc;ng phải để ủ dột, buồn b&atilde; qua những th&aacute;ng năm tươi đẹp của tuổi thanh xu&acirc;n.</p>

<p>Th&ocirc;i th&igrave;, t&igrave;nh y&ecirc;u đ&ocirc;i khi chỉ l&agrave; một tr&ograve; chơi của tuổi trẻ, nếu thua cuộc, h&atilde;y can đảm m&agrave; sống tiếp, rồi sẽ c&oacute; ho&agrave;ng tử xem ch&uacute;ng ta l&agrave; c&ocirc;ng ch&uacute;a để m&agrave; n&acirc;ng niu v&agrave; y&ecirc;u thương suốt đời th&ocirc;i, l&uacute;c đ&oacute; cất đi những c&aacute;i gai kia cũng được!</p>
', CAST(0xC33C0B00 AS Date), 6, N'/Data/images/TinTuc/rIGYuAyxTtUJVFLNBnT1591bce92bcfa5.jpg', 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_TinTuc] OFF
SET IDENTITY_INSERT [dbo].[tbl_Video] ON 

INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (2, N'Em chưa 18', 6, 2, 10, N'/asset/client/Audio_Video/Video/Em Chưa 18 - WILL - LOU HOÀNG - KAITY NGUYỄN - Em Chưa 18 OST - Official Lyric Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (3, N'Não cá vàng', 6, 3, 9, N'/asset/client/Audio_Video/Video/NÃO CÁ VÀNG - ONLY C ft. LOU HOÀNG - OFFICIAL MV 2017.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/ChiTietVideo/EYqPh5iG7tY0vSvGFHMJ58bcd4ae2ce1b.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (4, N'Em chưa 18', 6, 2, 10, N'/asset/client/Audio_Video/Video/Em Chưa 18 - WILL - LOU HOÀNG - KAITY NGUYỄN - Em Chưa 18 OST - Official Lyric Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (5, N'Em chưa 18', 6, 2, 10, N'/asset/client/Audio_Video/Video/Em Chưa 18 - WILL - LOU HOÀNG - KAITY NGUYỄN - Em Chưa 18 OST - Official Lyric Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (6, N'Em chưa 18', 6, 2, 10, N'/asset/client/Audio_Video/Video/Em Chưa 18 - WILL - LOU HOÀNG - KAITY NGUYỄN - Em Chưa 18 OST - Official Lyric Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (7, N'Em chưa 18', 6, 2, 10, N'/asset/client/Audio_Video/Video/Em Chưa 18 - WILL - LOU HOÀNG - KAITY NGUYỄN - Em Chưa 18 OST - Official Lyric Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (8, N'Em chưa 18', 6, 2, 10, N'/asset/client/Audio_Video/Video/Em Chưa 18 - WILL - LOU HOÀNG - KAITY NGUYỄN - Em Chưa 18 OST - Official Lyric Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (9, N'Yêu là tha thứ', 7, 2, 9, N'/asset/client/Audio_Video/Video/Yêu Là ''Tha Thu'' - Only C - Em Chưa 18 OST - Official Music Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (10, N'Yêu là tha thứ', 7, 3, 9, N'/asset/client/Audio_Video/Video/Yêu Là ''Tha Thu'' - Only C - Em Chưa 18 OST - Official Music Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (11, N'Yêu là tha thứ', 7, 4, 9, N'/asset/client/Audio_Video/Video/Yêu Là ''Tha Thu'' - Only C - Em Chưa 18 OST - Official Music Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (12, N'Yêu là tha thứ', 7, 5, 9, N'/asset/client/Audio_Video/Video/Yêu Là ''Tha Thu'' - Only C - Em Chưa 18 OST - Official Music Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
INSERT [dbo].[tbl_Video] ([Id], [Ten_Video], [Id_CaSi], [LuotXem], [Id_TheLoai], [Url_Video], [Active], [Id_ChuDe], [Id_NhanVien], [NgayDang], [urlImage], [Ord]) VALUES (13, N'Yêu là tha thứ', 7, 6, 9, N'/asset/client/Audio_Video/Video/Yêu Là ''Tha Thu'' - Only C - Em Chưa 18 OST - Official Music Video.mp4', 1, NULL, NULL, NULL, N'/asset/client/images/TrangChu/RMuM0Scg2AWZryvq7tsA590d7927b8faf.jpg', 1)
SET IDENTITY_INSERT [dbo].[tbl_Video] OFF
/****** Object:  Index [IX_Id_Album]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_Album] ON [dbo].[tbl_BaiHat]
(
	[Id_Album] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_CaSi]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_CaSi] ON [dbo].[tbl_BaiHat]
(
	[Id_CaSi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_ChuDe]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_ChuDe] ON [dbo].[tbl_BaiHat]
(
	[Id_ChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID_NhacSi]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_ID_NhacSi] ON [dbo].[tbl_BaiHat]
(
	[ID_NhacSi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_TheLoai]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_TheLoai] ON [dbo].[tbl_BaiHat]
(
	[Id_TheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_Quyen]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_Quyen] ON [dbo].[tbl_NhanVien]
(
	[Id_Quyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_nhanvien]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_id_nhanvien] ON [dbo].[tbl_TinTuc]
(
	[id_nhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_CaSi]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_CaSi] ON [dbo].[tbl_Video]
(
	[Id_CaSi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_ChuDe]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_ChuDe] ON [dbo].[tbl_Video]
(
	[Id_ChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_NhanVien]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_NhanVien] ON [dbo].[tbl_Video]
(
	[Id_NhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id_TheLoai]    Script Date: 5/29/2017 10:23:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_Id_TheLoai] ON [dbo].[tbl_Video]
(
	[Id_TheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_TinTuc] ADD  CONSTRAINT [DF_tbl_TinTuc_LuotXem]  DEFAULT ((0)) FOR [LuotXem]
GO
ALTER TABLE [dbo].[tbl_BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_Album_Id_Album] FOREIGN KEY([Id_Album])
REFERENCES [dbo].[tbl_Album] ([Id])
GO
ALTER TABLE [dbo].[tbl_BaiHat] CHECK CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_Album_Id_Album]
GO
ALTER TABLE [dbo].[tbl_BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_CaSi_Id_CaSi] FOREIGN KEY([Id_CaSi])
REFERENCES [dbo].[tbl_CaSi] ([Id])
GO
ALTER TABLE [dbo].[tbl_BaiHat] CHECK CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_CaSi_Id_CaSi]
GO
ALTER TABLE [dbo].[tbl_BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_ChuDe_Id_ChuDe] FOREIGN KEY([Id_ChuDe])
REFERENCES [dbo].[tbl_ChuDe] ([Id])
GO
ALTER TABLE [dbo].[tbl_BaiHat] CHECK CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_ChuDe_Id_ChuDe]
GO
ALTER TABLE [dbo].[tbl_BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_NhacSi_ID_NhacSi] FOREIGN KEY([ID_NhacSi])
REFERENCES [dbo].[tbl_NhacSi] ([Id])
GO
ALTER TABLE [dbo].[tbl_BaiHat] CHECK CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_NhacSi_ID_NhacSi]
GO
ALTER TABLE [dbo].[tbl_BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_TheLoai_Id_TheLoai] FOREIGN KEY([Id_TheLoai])
REFERENCES [dbo].[tbl_TheLoai] ([Id])
GO
ALTER TABLE [dbo].[tbl_BaiHat] CHECK CONSTRAINT [FK_dbo.tbl_BaiHat_dbo.tbl_TheLoai_Id_TheLoai]
GO
ALTER TABLE [dbo].[tbl_NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_NhanVien_dbo.tbl_Quyen_Id_Quyen] FOREIGN KEY([Id_Quyen])
REFERENCES [dbo].[tbl_Quyen] ([Id])
GO
ALTER TABLE [dbo].[tbl_NhanVien] CHECK CONSTRAINT [FK_dbo.tbl_NhanVien_dbo.tbl_Quyen_Id_Quyen]
GO
ALTER TABLE [dbo].[tbl_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_TinTuc_dbo.tbl_NhanVien_id_nhanvien] FOREIGN KEY([id_nhanvien])
REFERENCES [dbo].[tbl_NhanVien] ([Id])
GO
ALTER TABLE [dbo].[tbl_TinTuc] CHECK CONSTRAINT [FK_dbo.tbl_TinTuc_dbo.tbl_NhanVien_id_nhanvien]
GO
ALTER TABLE [dbo].[tbl_Video]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_CaSi_Id_CaSi] FOREIGN KEY([Id_CaSi])
REFERENCES [dbo].[tbl_CaSi] ([Id])
GO
ALTER TABLE [dbo].[tbl_Video] CHECK CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_CaSi_Id_CaSi]
GO
ALTER TABLE [dbo].[tbl_Video]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_ChuDe_Id_ChuDe] FOREIGN KEY([Id_ChuDe])
REFERENCES [dbo].[tbl_ChuDe] ([Id])
GO
ALTER TABLE [dbo].[tbl_Video] CHECK CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_ChuDe_Id_ChuDe]
GO
ALTER TABLE [dbo].[tbl_Video]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_NhanVien_Id_NhanVien] FOREIGN KEY([Id_NhanVien])
REFERENCES [dbo].[tbl_NhanVien] ([Id])
GO
ALTER TABLE [dbo].[tbl_Video] CHECK CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_NhanVien_Id_NhanVien]
GO
ALTER TABLE [dbo].[tbl_Video]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_TheLoai_Id_TheLoai] FOREIGN KEY([Id_TheLoai])
REFERENCES [dbo].[tbl_TheLoai] ([Id])
GO
ALTER TABLE [dbo].[tbl_Video] CHECK CONSTRAINT [FK_dbo.tbl_Video_dbo.tbl_TheLoai_Id_TheLoai]
GO
