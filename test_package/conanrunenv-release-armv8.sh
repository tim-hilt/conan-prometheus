script_folder="/Users/timhilt/dev/conan-prometheus/test_package"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-release-armv8.sh"
for v in PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-release-armv8.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanrunenv-release-armv8.sh"
    fi
done


export PATH="/Users/timhilt/.conan2/p/b/conan395c09e2775d1/p/bin:$PATH"