using Microsoft.EntityFrameworkCore;

namespace E.CommerceProject.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet <Config> Configs { get; set; }
        public DbSet <Role> Roles { get; set; }
        public DbSet <Admin> Admins { get; set; }
        public DbSet <User> Users { get; set; }
        public DbSet <Category> Categories { get; set; }
        public DbSet <Brand> Brands { get; set; }
        public DbSet <Supplier> Suppliers { get; set; }
        public DbSet <Color> Colors { get; set; }
        public DbSet <AssembleIn> AssembleIns { get; set; }
        public DbSet <Product> Products { get; set; }
        public DbSet <ProductImage> ProductImages { get; set; }
        public DbSet<WishList> WishLists { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<BillingAddress> BillingAddresses { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Tạo chỉ mục duy nhất cho BrandName
            modelBuilder.Entity<Brand>()
                .HasIndex(b => b.BrandName)
                .IsUnique();

            // Tạo chỉ mục duy nhất cho BrandLogo
            modelBuilder.Entity<Brand>()
                .HasIndex(b => b.Logo)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho SupplierName
            modelBuilder.Entity<Supplier>()
                .HasIndex(s => s.Name)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho SupplierTaxCode
            modelBuilder.Entity<Supplier>()
                .HasIndex(s => s.TaxCode)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho SupplierWebsite
            modelBuilder.Entity<Supplier>()
                .HasIndex(s => s.Website)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho SupplierLogo
            modelBuilder.Entity<Supplier>()
                .HasIndex(s => s.Logo)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho SupplierLogo
            modelBuilder.Entity<Color>()
                .HasIndex(c => c.ColorCode)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho SupplierLogo
            modelBuilder.Entity<Color>()
                .HasIndex(c => c.ColorName)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho AssembleIn
            modelBuilder.Entity<AssembleIn>()
                .HasIndex(a => a.Country)
                .IsUnique();

            //Tạo chỉ mục duy nhất cho Prodcut
            modelBuilder.Entity<Product>()
                .HasIndex(p => p.Name)
                .IsUnique();

            modelBuilder.Entity<BillingAddress>(entity =>
            {
                entity.Property(e => e.BillingAddressFirstName).IsRequired(false);
                entity.Property(e => e.BillingAddressLastName).IsRequired(false);
                entity.Property(e => e.BillingAddressAddress).IsRequired(false);
                entity.Property(e => e.BillingAddressAddress).IsRequired(false);
                entity.Property(e => e.BillingAddressCity).IsRequired(false);
                entity.Property(e => e.BillingAddressCountry).IsRequired(false);
                entity.Property(e => e.BillingAddressZipCode).IsRequired(false);
                entity.Property(e => e.BillingAddressTelephone).IsRequired(false);
                // ... 
                entity.Property(e => e.ShippingAddressFirstName).IsRequired(false);
                entity.Property(e => e.ShippingAddressLastName).IsRequired(false);
                entity.Property(e => e.ShippingAddressEmail).IsRequired(false);
                entity.Property(e => e.ShippingAddressAddress).IsRequired(false);
                entity.Property(e => e.ShippingAddressCity).IsRequired(false);
                entity.Property(e => e.ShippingAddressCountry).IsRequired(false);
                entity.Property(e => e.ShippingAddressZipCode).IsRequired(false);
                entity.Property(e => e.ShippingAddressTelephone).IsRequired(false);
            });

            //Tạo chỉ mục duy nhất cho WishList
            modelBuilder.Entity<WishList>()
              .HasIndex(w => new { w.UserId, w.ProductId })
              .IsUnique();

            base.OnModelCreating(modelBuilder);
        }
    }
}
