
xcopy .\*.proto .\protocs\ /y
xcopy .\*.proto .\pblua\protobuf\luascript /y

cd protocs\

for %%i in (*.proto) do (  
echo %%i
protogen -i:%%i -o:%%~ni.cs
)
echo end

xcopy *.cs ..\..\server\proto-msg\cs /y


cd  ..\pblua\protobuf\luascript  
for %%i in (*.proto) do (    
echo %%i  
"..\..\protoc.exe" --plugin=protoc-gen-lua="..\..\plugin\protoc-gen-lua.bat" --lua_out=. %%i    
)  
echo end  

xcopy *.lua ..\..\..\..\Client\Assets\Lua\pblua /y

pause