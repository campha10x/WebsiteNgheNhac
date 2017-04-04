namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InstallDb : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tbl_Album",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        TenAlBum = c.String(),
                        TomTat = c.String(),
                        Active = c.Boolean(),
                        UrlImage = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tbl_BaiHat",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        TenBaiHat = c.String(),
                        url_BaiHat = c.String(unicode: false),
                        LuotNghe = c.Int(),
                        LuotTai = c.Int(),
                        Active = c.Boolean(),
                        Id_TheLoai = c.Long(),
                        Id_CaSi = c.Long(),
                        Id_ChuDe = c.Long(),
                        Id_Album = c.Long(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.tbl_CaSi", t => t.Id_CaSi)
                .ForeignKey("dbo.tbl_ChuDe", t => t.Id_ChuDe)
                .ForeignKey("dbo.tbl_TheLoai", t => t.Id_TheLoai)
                .ForeignKey("dbo.tbl_Album", t => t.Id_Album)
                .Index(t => t.Id_TheLoai)
                .Index(t => t.Id_CaSi)
                .Index(t => t.Id_ChuDe)
                .Index(t => t.Id_Album);
            
            CreateTable(
                "dbo.tbl_CaSi",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        NgheDanh = c.String(),
                        TenThat = c.String(),
                        NgaySinh = c.DateTime(storeType: "date"),
                        KhaNang = c.String(),
                        TrinhDoHocVan = c.String(),
                        MoTaSuNghiep = c.String(maxLength: 10, fixedLength: true),
                        urlImage = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tbl_Video",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        Ten_Video = c.String(maxLength: 50),
                        Id_CaSi = c.Long(),
                        LuotXem = c.Int(),
                        Id_TheLoai = c.Long(),
                        Url_Video = c.String(maxLength: 50, unicode: false),
                        Active = c.Boolean(),
                        Id_ChuDe = c.Long(),
                        Id_NhanVien = c.Long(),
                        NgayDang = c.DateTime(storeType: "date"),
                        urlImage = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.tbl_ChuDe", t => t.Id_ChuDe)
                .ForeignKey("dbo.tbl_NhanVien", t => t.Id_NhanVien)
                .ForeignKey("dbo.tbl_TheLoai", t => t.Id_TheLoai)
                .ForeignKey("dbo.tbl_CaSi", t => t.Id_CaSi)
                .Index(t => t.Id_CaSi)
                .Index(t => t.Id_TheLoai)
                .Index(t => t.Id_ChuDe)
                .Index(t => t.Id_NhanVien);
            
            CreateTable(
                "dbo.tbl_ChuDe",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        Ten_ChuDe = c.String(),
                        url_Image = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tbl_NhanVien",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        tenNV = c.String(maxLength: 50),
                        NgaySinh = c.DateTime(storeType: "date"),
                        gioitinh = c.String(maxLength: 50),
                        ChucVu = c.String(maxLength: 50),
                        Id_Quyen = c.Long(),
                        UserName = c.String(maxLength: 50),
                        Password = c.String(maxLength: 50, fixedLength: true),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.tbl_Quyen", t => t.Id_Quyen)
                .Index(t => t.Id_Quyen);
            
            CreateTable(
                "dbo.tbl_Quyen",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        TenQuyen = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tbl_TinTuc",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        TieuDe = c.String(),
                        TomTat = c.String(),
                        NoiDung = c.String(),
                        ngayviet = c.DateTime(storeType: "date"),
                        id_nhanvien = c.Long(),
                        urlHinhAnh = c.String(unicode: false),
                        LuotXem = c.Int(),
                        Active = c.Boolean(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.tbl_NhanVien", t => t.id_nhanvien)
                .Index(t => t.id_nhanvien);
            
            CreateTable(
                "dbo.tbl_TheLoai",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        Ten_TheLoai = c.String(),
                        Active = c.Boolean(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tbl_NguoiDung",
                c => new
                    {
                        Id = c.Long(nullable: false),
                        TaiKhoan = c.String(maxLength: 50),
                        MatKhau = c.String(maxLength: 50),
                        Active = c.Boolean(),
                        Fb = c.String(),
                        Google = c.String(name: "Google+"),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tbl_QuangCao",
                c => new
                    {
                        Id = c.Long(nullable: false, identity: true),
                        UrlImage = c.String(maxLength: 50, unicode: false),
                        Active = c.Boolean(),
                        Count_Click = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.tbl_Slide_GioiThieu",
                c => new
                    {
                        id = c.Long(nullable: false, identity: true),
                        urlImage = c.String(maxLength: 50, unicode: false),
                        Active = c.Boolean(),
                        Count_Click = c.Int(),
                        UrlNhac = c.String(maxLength: 50),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.tbl_BaiHat", "Id_Album", "dbo.tbl_Album");
            DropForeignKey("dbo.tbl_Video", "Id_CaSi", "dbo.tbl_CaSi");
            DropForeignKey("dbo.tbl_Video", "Id_TheLoai", "dbo.tbl_TheLoai");
            DropForeignKey("dbo.tbl_BaiHat", "Id_TheLoai", "dbo.tbl_TheLoai");
            DropForeignKey("dbo.tbl_Video", "Id_NhanVien", "dbo.tbl_NhanVien");
            DropForeignKey("dbo.tbl_TinTuc", "id_nhanvien", "dbo.tbl_NhanVien");
            DropForeignKey("dbo.tbl_NhanVien", "Id_Quyen", "dbo.tbl_Quyen");
            DropForeignKey("dbo.tbl_Video", "Id_ChuDe", "dbo.tbl_ChuDe");
            DropForeignKey("dbo.tbl_BaiHat", "Id_ChuDe", "dbo.tbl_ChuDe");
            DropForeignKey("dbo.tbl_BaiHat", "Id_CaSi", "dbo.tbl_CaSi");
            DropIndex("dbo.tbl_TinTuc", new[] { "id_nhanvien" });
            DropIndex("dbo.tbl_NhanVien", new[] { "Id_Quyen" });
            DropIndex("dbo.tbl_Video", new[] { "Id_NhanVien" });
            DropIndex("dbo.tbl_Video", new[] { "Id_ChuDe" });
            DropIndex("dbo.tbl_Video", new[] { "Id_TheLoai" });
            DropIndex("dbo.tbl_Video", new[] { "Id_CaSi" });
            DropIndex("dbo.tbl_BaiHat", new[] { "Id_Album" });
            DropIndex("dbo.tbl_BaiHat", new[] { "Id_ChuDe" });
            DropIndex("dbo.tbl_BaiHat", new[] { "Id_CaSi" });
            DropIndex("dbo.tbl_BaiHat", new[] { "Id_TheLoai" });
            DropTable("dbo.tbl_Slide_GioiThieu");
            DropTable("dbo.tbl_QuangCao");
            DropTable("dbo.tbl_NguoiDung");
            DropTable("dbo.tbl_TheLoai");
            DropTable("dbo.tbl_TinTuc");
            DropTable("dbo.tbl_Quyen");
            DropTable("dbo.tbl_NhanVien");
            DropTable("dbo.tbl_ChuDe");
            DropTable("dbo.tbl_Video");
            DropTable("dbo.tbl_CaSi");
            DropTable("dbo.tbl_BaiHat");
            DropTable("dbo.tbl_Album");
        }
    }
}
