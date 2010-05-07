# HG changeset patch
# User Dave Townsend <dtownsend@oxymoronical.com>
# Date 1271092654 25200
# Node ID dc4aba80149e52b6fb7dec6ec7281bcd9b7aa86b
# Parent  07f470a80f70e9a04b9dcff0e2db777130fddbea
[palm] Make profile directory work

diff --git a/toolkit/xre/nsXREDirProvider.cpp b/toolkit/xre/nsXREDirProvider.cpp
--- a/toolkit/xre/nsXREDirProvider.cpp
+++ b/toolkit/xre/nsXREDirProvider.cpp
@@ -1167,6 +1167,12 @@ nsXREDirProvider::GetUserDataDirectoryHo
 
   rv = NS_NewNativeLocalFile(nsDependentCString(appDir), PR_TRUE,
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
