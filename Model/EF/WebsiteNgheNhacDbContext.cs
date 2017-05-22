namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using System.Data.Entity.Validation;

    public partial class WebsiteNgheNhacDbContext : DbContext
    {
      
        public WebsiteNgheNhacDbContext()
            : base("name=WebsiteNgheNhac")
        {
           
        }

        public virtual DbSet<tbl_Album> tbl_Album { get; set; }
        public virtual DbSet<tbl_BaiHat> tbl_BaiHat { get; set; }
        public virtual DbSet<tbl_CaSi> tbl_CaSi { get; set; }
        public virtual DbSet<tbl_ChuDe> tbl_ChuDe { get; set; }
        public virtual DbSet<tbl_NguoiDung> tbl_NguoiDung { get; set; }
        public virtual DbSet<tbl_NhanVien> tbl_NhanVien { get; set; }
        public virtual DbSet<tbl_QuangCao> tbl_QuangCao { get; set; }
        public virtual DbSet<tbl_Quyen> tbl_Quyen { get; set; }
        public virtual DbSet<tbl_Slide_GioiThieu> tbl_Slide_GioiThieu { get; set; }
        public virtual DbSet<tbl_TheLoai> tbl_TheLoai { get; set; }
        public virtual DbSet<tbl_TinTuc> tbl_TinTuc { get; set; }
        public virtual DbSet<tbl_Video> tbl_Video { get; set; }
        public virtual DbSet<tbl_Menu> tbl_Menu { get; set; }
        public virtual DbSet<tbl_NhacSi> tbl_NhacSi { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tbl_Album>()
                .HasMany(e => e.tbl_BaiHat)
                .WithOptional(e => e.tbl_Album)
                .HasForeignKey(e => e.Id_Album);

            modelBuilder.Entity<tbl_BaiHat>()
                .Property(e => e.url_BaiHat)
                .IsUnicode(false);
            modelBuilder.Entity<tbl_BaiHat>()
                .Property(e => e.url_Image)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_CaSi>()
                .Property(e => e.MoTaSuNghiep)
                .IsFixedLength();

            modelBuilder.Entity<tbl_CaSi>()
                .Property(e => e.urlImage)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_CaSi>()
                .HasMany(e => e.tbl_BaiHat)
                .WithOptional(e => e.tbl_CaSi)
                .HasForeignKey(e => e.Id_CaSi);

            modelBuilder.Entity<tbl_Menu>()
                .HasKey(e => e.ID);

            modelBuilder.Entity<tbl_CaSi>()
                .HasMany(e => e.tbl_Video)
                .WithOptional(e => e.tbl_CaSi)
                .HasForeignKey(e => e.Id_CaSi);

           //modelBuilder.Entity(tbl_NhacSi)()
           //     .HasMany(e => e.tbl_BaiHat)
           //     .WithOptional(e => e.tbl_CaSi)
           //     .HasForeignKey(e => e.Id_CaSi);


            modelBuilder.Entity<tbl_ChuDe>()
                .Property(e => e.url_Image)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_ChuDe>()
                .HasMany(e => e.tbl_BaiHat)
                .WithOptional(e => e.tbl_ChuDe)
                .HasForeignKey(e => e.Id_ChuDe);
            modelBuilder.Entity<tbl_ChuDe>()
                .Property(f => f.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            modelBuilder.Entity<tbl_ChuDe>()
                .HasMany(e => e.tbl_Video)
                .WithOptional(e => e.tbl_ChuDe)
                .HasForeignKey(e => e.Id_ChuDe);

            modelBuilder.Entity<tbl_NhanVien>()
                .Property(e => e.Password)
                .IsFixedLength();

            modelBuilder.Entity<tbl_NhanVien>()
                .HasMany(e => e.tbl_TinTuc)
                .WithOptional(e => e.tbl_NhanVien)
                .HasForeignKey(e => e.id_nhanvien);

            modelBuilder.Entity<tbl_NhanVien>()
                .HasMany(e => e.tbl_Video)
                .WithOptional(e => e.tbl_NhanVien)
                .HasForeignKey(e => e.Id_NhanVien);

            modelBuilder.Entity<tbl_QuangCao>()
                .Property(e => e.UrlImage)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_Quyen>()
                .HasMany(e => e.tbl_NhanVien)
                .WithOptional(e => e.tbl_Quyen)
                .HasForeignKey(e => e.Id_Quyen);

            modelBuilder.Entity<tbl_Slide_GioiThieu>()
                .Property(e => e.urlImage)
                .IsUnicode(false);


            modelBuilder.Entity<tbl_TheLoai>()
                .HasMany(e => e.tbl_BaiHat)
                .WithOptional(e => e.tbl_TheLoai)
                .HasForeignKey(e => e.Id_TheLoai);

            modelBuilder.Entity<tbl_TheLoai>()
                .HasMany(e => e.tbl_Video)
                .WithOptional(e => e.tbl_TheLoai)
                .HasForeignKey(e => e.Id_TheLoai);

            modelBuilder.Entity<tbl_TinTuc>()
                .Property(e => e.urlHinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_Video>()
                .Property(e => e.Url_Video)
                .IsUnicode(false);
        }
        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage));
                throw new DbEntityValidationException(errorMessages);
            }
        }
    }
}
