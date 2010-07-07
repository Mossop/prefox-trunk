# HG changeset patch
# User Dave Townsend <dtownsend@oxymoronical.com>
# Date 1278527524 25200
# Node ID dc4aba80149e52b6fb7dec6ec7281bcd9b7aa86b
# Parent e357a74652bbc3c759340ef5839735822dd256dd
[palm] Make profile directory work

diff --git a/toolkit/xre/nsXREDirProvider.cpp b/toolkit/xre/nsXREDirProvider.cpp
--- a/toolkit/xre/nsXREDirProvider.cpp
+++ b/toolkit/xre/nsXREDirProvider.cpp
@@ -1101,6 +1101,12 @@ nsXREDirProvider::GetUserDataDirectoryHo
 
   rv = NS_NewNativeLocalFile(nsDependentCString(homeDir), PR_TRUE,
                              getter_AddRefs(localDir));
+#elif defined(WEBOS)
+  // XXX temporary
+  const char* homeDir = "/media/internal";
+
+  rv = NS_NewNativeLocalFile(nsDependentCString(homeDir), PR_TRUE,
+                             getter_AddRefs(localDir));
 #elif defined(XP_UNIX)
   const char* homeDir = getenv("HOME");
   if (!homeDir || !*homeDir)
