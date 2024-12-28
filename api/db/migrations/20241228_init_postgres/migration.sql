CREATE EXTENSION IF NOT EXISTS vector; CREATE TABLE "Document" ("id" SERIAL PRIMARY KEY, "title" TEXT NOT NULL, "content" TEXT NOT NULL, "embedding" vector(1536), "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "updatedAt" TIMESTAMP(3) NOT NULL); CREATE TABLE "ChatMessage" ("id" SERIAL PRIMARY KEY, "role" TEXT NOT NULL, "content" TEXT NOT NULL, "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, "sessionId" TEXT NOT NULL); CREATE INDEX "Document_embedding_idx" ON "Document" USING ivfflat (embedding vector_cosine_ops); CREATE INDEX "ChatMessage_sessionId_idx" ON "ChatMessage"("sessionId");
