using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace E.CommerceProject.Migrations
{
    /// <inheritdoc />
    public partial class AddWishListTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_WishList_UserId",
                table: "WishList");

            migrationBuilder.AddColumn<DateTime>(
                name: "CreateTime",
                table: "WishList",
                type: "datetime",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.CreateIndex(
                name: "IX_WishList_UserId_ProductId",
                table: "WishList",
                columns: new[] { "UserId", "ProductId" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_WishList_UserId_ProductId",
                table: "WishList");

            migrationBuilder.DropColumn(
                name: "CreateTime",
                table: "WishList");

            migrationBuilder.CreateIndex(
                name: "IX_WishList_UserId",
                table: "WishList",
                column: "UserId");
        }
    }
}
