using Microsoft.EntityFrameworkCore.Migrations;

namespace Marvin.IDP.Migrations.MarvinUser
{
    public partial class InitialIdentityMarvinDbMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    SubjectId = table.Column<string>(maxLength: 50, nullable: false),
                    Username = table.Column<string>(maxLength: 100, nullable: false),
                    Password = table.Column<string>(maxLength: 100, nullable: true),
                    IsActive = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.SubjectId);
                });

            migrationBuilder.CreateTable(
                name: "Claims",
                columns: table => new
                {
                    Id = table.Column<string>(maxLength: 50, nullable: false),
                    SubjectId = table.Column<string>(maxLength: 50, nullable: false),
                    ClaimType = table.Column<string>(maxLength: 250, nullable: false),
                    ClaimValue = table.Column<string>(maxLength: 250, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Claims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Claims_Users_SubjectId",
                        column: x => x.SubjectId,
                        principalTable: "Users",
                        principalColumn: "SubjectId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserLogins",
                columns: table => new
                {
                    Id = table.Column<string>(maxLength: 50, nullable: false),
                    SubjectId = table.Column<string>(maxLength: 50, nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 250, nullable: false),
                    ProviderKey = table.Column<string>(maxLength: 250, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLogins", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserLogins_Users_SubjectId",
                        column: x => x.SubjectId,
                        principalTable: "Users",
                        principalColumn: "SubjectId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "SubjectId", "IsActive", "Password", "Username" },
                values: new object[] { "d860efca-22d9-47fd-8249-791ba61b07c7", true, "password", "Frank" });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "SubjectId", "IsActive", "Password", "Username" },
                values: new object[] { "b7539694-97e7-4dfe-84da-b4256e1ff5c7", true, "password", "Claire" });


            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "6f1434ae-ff78-4c28-8071-718eb4be92db", "role", "FreeUser", "d860efca-22d9-47fd-8249-791ba61b07c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "9512c4b4-c1b7-480f-9258-3d3cec0ab31d", "given_name", "Frank", "d860efca-22d9-47fd-8249-791ba61b07c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "8d507d1d-c20a-4f78-b287-b8dc0cdf3db9", "family_name", "Underwood", "d860efca-22d9-47fd-8249-791ba61b07c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "737dbdc9-0faa-4464-89fc-d7e1a9468a67", "address", "Main Street 1", "d860efca-22d9-47fd-8249-791ba61b07c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "814beb91-5888-4442-8127-ff9711d8688a", "subscriptionlevel", "FreeUser", "d860efca-22d9-47fd-8249-791ba61b07c7" });

            migrationBuilder.InsertData(
              table: "Claims",
              columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
              values: new object[] { "61747d15-3bd5-421a-b842-5fdbcd97d9a3", "country", "nl", "d860efca-22d9-47fd-8249-791ba61b07c7" });

            // claire
            migrationBuilder.InsertData(
                table: "Claims",
                columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
                values: new object[] { "eae5f19a-a69c-4fca-835d-628c9fe3f17e", "role", "PayingUser", "b7539694-97e7-4dfe-84da-b4256e1ff5c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "7283c70a-6ac3-4d72-a64d-431acd54a93a", "given_name", "Claire", "b7539694-97e7-4dfe-84da-b4256e1ff5c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "fa8fa555-d89c-4404-bf1a-8d4173765e60", "family_name", "Underwood", "b7539694-97e7-4dfe-84da-b4256e1ff5c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "268217e2-fd01-4f26-8fe1-d7070eff1724", "address", "Main Road 1", "b7539694-97e7-4dfe-84da-b4256e1ff5c7" });

            migrationBuilder.InsertData(
               table: "Claims",
               columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
               values: new object[] { "aa691ac9-9b40-412b-b707-9c8efcf4ed0c", "subscriptionlevel", "PayingUser", "b7539694-97e7-4dfe-84da-b4256e1ff5c7" });

            migrationBuilder.InsertData(
              table: "Claims",
              columns: new[] { "Id", "ClaimType", "ClaimValue", "SubjectId" },
              values: new object[] { "89c57b24-b090-4fb7-89cb-e4ebf3b2e5b7", "country", "be", "b7539694-97e7-4dfe-84da-b4256e1ff5c7" });



            migrationBuilder.CreateIndex(
                name: "IX_Claims_SubjectId",
                table: "Claims",
                column: "SubjectId");

            migrationBuilder.CreateIndex(
                name: "IX_UserLogins_SubjectId",
                table: "UserLogins",
                column: "SubjectId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Claims");

            migrationBuilder.DropTable(
                name: "UserLogins");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
