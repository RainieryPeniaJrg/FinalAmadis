﻿// <auto-generated />
using System;
using BE.FinalAmadis.DataLayer.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace BE.FinalAmadis.DataLayer.Migrations
{
    [DbContext(typeof(ProyectoContext))]
    partial class ProyectoContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.14")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("BE.FinalAmadis.DataLayer.Entities.Conductor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Cedula")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Direccion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FechaNacimiento")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NumeroDeTelefono")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Conductores");
                });

            modelBuilder.Entity("BE.FinalAmadis.DataLayer.Entities.Multas", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("CedulaInfractor")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Comentario")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<double>("Latitud")
                        .HasColumnType("float");

                    b.Property<double>("Longitud")
                        .HasColumnType("float");

                    b.Property<string>("PlacaVehiculo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("TipoMultaId")
                        .HasColumnType("int");

                    b.Property<int>("VehiculoId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("TipoMultaId");

                    b.HasIndex("VehiculoId");

                    b.ToTable("Multas");
                });

            modelBuilder.Entity("BE.FinalAmadis.DataLayer.Entities.TipoMulta", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("TiposMultas");
                });

            modelBuilder.Entity("BE.FinalAmadis.DataLayer.Entities.Vehiculos", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("Anio")
                        .HasColumnType("int");

                    b.Property<string>("Color")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Marca")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Modelo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Placa")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Vehiculos");
                });

            modelBuilder.Entity("BE.FinalAmadis.DataLayer.Entities.Multas", b =>
                {
                    b.HasOne("BE.FinalAmadis.DataLayer.Entities.TipoMulta", "TipoMulta")
                        .WithMany()
                        .HasForeignKey("TipoMultaId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("BE.FinalAmadis.DataLayer.Entities.Vehiculos", "Vehiculo")
                        .WithMany()
                        .HasForeignKey("VehiculoId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("TipoMulta");

                    b.Navigation("Vehiculo");
                });
#pragma warning restore 612, 618
        }
    }
}
