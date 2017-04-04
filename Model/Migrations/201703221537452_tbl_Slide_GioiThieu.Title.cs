namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tbl_Slide_GioiThieuTitle : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.tbl_Menu", newName: "tbl_Menu");
            AddColumn("dbo.tbl_Slide_GioiThieu", "Title", c => c.String(maxLength: 200));
            AlterColumn("dbo.tbl_Slide_GioiThieu", "urlImage", c => c.String(maxLength: 200, unicode: false));
            AlterColumn("dbo.tbl_Slide_GioiThieu", "UrlNhac", c => c.String(maxLength: 200));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.tbl_Slide_GioiThieu", "UrlNhac", c => c.String(maxLength: 50));
            AlterColumn("dbo.tbl_Slide_GioiThieu", "urlImage", c => c.String(maxLength: 50, unicode: false));
            DropColumn("dbo.tbl_Slide_GioiThieu", "Title");
            RenameTable(name: "dbo.tbl_Menu", newName: "tbl_Menu");
        }
    }
}
