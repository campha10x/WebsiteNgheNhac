namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tbl_BaiHat : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.tbl_BaiHat", "Id_ChuDe", "dbo.tbl_ChuDe");
            DropForeignKey("dbo.tbl_Video", "Id_ChuDe", "dbo.tbl_ChuDe");
            DropPrimaryKey("dbo.tbl_Video");
            DropPrimaryKey("dbo.tbl_ChuDe");
            AddColumn("dbo.tbl_BaiHat", "url_Image", c => c.String(unicode: false));
            AlterColumn("dbo.tbl_CaSi", "MoTaSuNghiep", c => c.String(maxLength: 128, fixedLength: true));
            AlterColumn("dbo.tbl_Video", "Id", c => c.Long(nullable: false, identity: true));
            AlterColumn("dbo.tbl_Video", "urlImage", c => c.String(maxLength: 200));
            AlterColumn("dbo.tbl_ChuDe", "Id", c => c.Long(nullable: false, identity: true));
            AddPrimaryKey("dbo.tbl_Video", "Id");
            AddPrimaryKey("dbo.tbl_ChuDe", "Id");
            AddForeignKey("dbo.tbl_BaiHat", "Id_ChuDe", "dbo.tbl_ChuDe", "Id");
            AddForeignKey("dbo.tbl_Video", "Id_ChuDe", "dbo.tbl_ChuDe", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.tbl_Video", "Id_ChuDe", "dbo.tbl_ChuDe");
            DropForeignKey("dbo.tbl_BaiHat", "Id_ChuDe", "dbo.tbl_ChuDe");
            DropPrimaryKey("dbo.tbl_ChuDe");
            DropPrimaryKey("dbo.tbl_Video");
            AlterColumn("dbo.tbl_ChuDe", "Id", c => c.Long(nullable: false));
            AlterColumn("dbo.tbl_Video", "urlImage", c => c.String(maxLength: 50));
            AlterColumn("dbo.tbl_Video", "Id", c => c.Long(nullable: false));
            AlterColumn("dbo.tbl_CaSi", "MoTaSuNghiep", c => c.String(maxLength: 10, fixedLength: true));
            DropColumn("dbo.tbl_BaiHat", "url_Image");
            AddPrimaryKey("dbo.tbl_ChuDe", "Id");
            AddPrimaryKey("dbo.tbl_Video", "Id");
            AddForeignKey("dbo.tbl_Video", "Id_ChuDe", "dbo.tbl_ChuDe", "Id");
            AddForeignKey("dbo.tbl_BaiHat", "Id_ChuDe", "dbo.tbl_ChuDe", "Id");
        }
    }
}
