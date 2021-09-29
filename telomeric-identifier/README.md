See https://github.com/tolkit/telomeric-identifier

```
git clone https://github.com/tolkit/telomeric-identifier.git
cd  telomeric-identifier
module load rust
cargo build --release -j 24
mkdir -p /opt/linux/centos/7.x/x86_64/pkg/telomeric-identifier/0.1.5
cp target/release/tidk /opt/linux/centos/7.x/x86_64/pkg/telomeric-identifier/0.1.5
```

