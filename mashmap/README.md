https://github.com/marbl/MashMap

```
diff --git a/CMakeLists.txt b/CMakeLists.txt
index 9a32105..2825dee 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -93,6 +93,7 @@ target_link_libraries(mashmap
   gslcblas
   m
   pthread
+  stdc++fs
   #rt
   z
   #assert
@@ -103,6 +104,7 @@ target_link_libraries(mashmap-align
   gslcblas
   m
   pthread
+  stdc++fs
   #rt
   z
   #assert
```
