namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tbl_NguoiDung : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.tbl_NguoiDung", "Email", c => c.String(maxLength: 50));
        }
        
        public override void Down()
        {
            DropColumn("dbo.tbl_NguoiDung", "Email");
        }
    }
}
