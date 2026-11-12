# mi-api-tareas

App de tareas con Flask (API REST), Vue 3, Supabase y Vercel.

## 1. Base de datos

En Supabase, abrir **SQL Editor > New query**, pegar el contenido de `supabase.sql` y pulsar **Run**.
Luego copiar la **Project URL** y la **clave de servicio** (service_role / Secret key) desde Project Settings > API Keys.

## 2. Prueba local (Ubuntu)

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

export SUPABASE_URL="https://xxxxxxxx.supabase.co"
export SUPABASE_KEY="clave_de_servicio"
flask --app api/index run
```

Abrir http://127.0.0.1:5000/api/tareas. Debe responder `[]`.

## 3. Subir a GitHub

Crear el repo vacío `mi-api-tareas` en GitHub (sin README ni .gitignore) y ejecutar:

```bash
git init
git add .
git commit -m "API de tareas con Flask, Vue y Supabase"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/mi-api-tareas.git
git push -u origin main
```

## 4. Desplegar en Vercel

**Add New > Project**, importar `mi-api-tareas` y, antes de pulsar Deploy, agregar en **Environment Variables**:

| Nombre | Valor |
|---|---|
| SUPABASE_URL | Project URL de Supabase |
| SUPABASE_KEY | Clave de servicio |

Si las variables se agregan después, hacer **Redeploy** desde la pestaña Deployments.

## 5. Probar con curl

```bash
curl -X POST https://tu-proyecto.vercel.app/api/tareas \
  -H "Content-Type: application/json" \
  -d '{
    "titulo": "Probar API",
    "descripcion": "Primera tarea"
  }'

curl https://tu-proyecto.vercel.app/api/tareas

curl -X PUT https://tu-proyecto.vercel.app/api/tareas/1 \
  -H "Content-Type: application/json" \
  -d '{
    "completada": true
  }'

curl -X DELETE https://tu-proyecto.vercel.app/api/tareas/1
```

## Rutas

| Método | Ruta | Respuesta |
|---|---|---|
| GET | /api/tareas | 200 |
| GET | /api/tareas/{id} | 200 o 404 |
| POST | /api/tareas | 201 o 400 |
| PUT | /api/tareas/{id} | 200, 400 o 404 |
| DELETE | /api/tareas/{id} | 204 o 404 |
