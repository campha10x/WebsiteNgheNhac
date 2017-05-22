namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tbl_TinTuc : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tbl_Video", "Ord", c => c.Int(nullable: false));
            AddColumn("dbo.tbl_TinTuc", "ID_BaiHat", c => c.Long());
            CreateIndex("dbo.tbl_TinTuc", "ID_BaiHat");
            AddForeignKey("dbo.tbl_TinTuc", "ID_BaiHat", "dbo.tbl_BaiHat", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.tbl_TinTuc", "ID_BaiHat", "dbo.tbl_BaiHat");
            DropIndex("dbo.tbl_TinTuc", new[] { "ID_BaiHat" });
            DropColumn("dbo.tbl_TinTuc", "ID_BaiHat");
            DropColumn("dbo.tbl_Video", "Ord");
        }
    }
}
