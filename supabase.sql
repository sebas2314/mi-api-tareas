create table public.tareas (
  id bigint generated always as identity primary key,
  titulo text not null,
  descripcion text,
  completada boolean not null default false,
  creada_en timestamptz not null default now()
);

alter table public.tareas enable row level security;
