namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class tbl_Menu : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.tbl_Menu",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Text = c.String(maxLength: 50),
                        Link = c.String(maxLength: 50),
                        Target = c.String(maxLength: 50),
                        Status = c.Boolean(),
                        DisplayOrder = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.tbl_Menu");
        }
    }
}
