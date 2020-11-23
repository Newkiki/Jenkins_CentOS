Create jenkins account and set default shell to bash
ให้เราสร้าง user ชื่อ jenkins ขั้นมาในทุกๆเครื่อง (ทำให้ครบทั้ง 3 เครื่อง) useradd jenkins passwd jenkins

รันคำสั่ง visudo แล้วเพิ่ม jenkins ALL=(ALL) NOPASSWD: ALL ให้ทำต่อจากบรรทัดของ root ที่ทำเช่นนี้เพื่อที่จะได้ไม่ต้องใส่ password เวลา build package จาก jenkins user ให้ copy หรือพิมพ์เองก็ได้ visudo ให้ใส่เพิ่มเข้าไปที่บรรทัดที่ 93 jenkins ALL=(ALL) NOPASSWD: ALL thanaporn ALL=(ALL) NOPASSWD: ALL

SSH Key
ให้เราทำ ssh key ที่เครื่อง jenkins แล้วส่งไปยังเครื่องปลายทาง (gitlab, docker) เราจะสร้าง ssh key ด้วย user jenkins ทีเราพึ่งสร้างมา

su - jenkins
$ ssh-keygen

เมื่อได้ keys แล้วให้ส่งไปที่เครื่องปลายทางโดยเราจะเข้าไปที่ปลายทางด้วย user jenkins (ที่เราสร้างและทำ visudo ไว้แล้วทั้งสองเครื่อง (gitlab, docker)

$ ssh-copy-id jenkins@192.168.7.8 (หรือใส่ ชื่อที่มีอยู่บน cloud .azure) $ ssh-copy-id jenkins@192.168.7.8 ให้copy ไว้ที่ตัวมันเองด้วย (jenkins.example.com) $ ssh-copy-id jenkins@localhost

ทดสอบ login ssh jenkins@192.168.7.8 ssh jenkins@localhost

เสร็จแล้วไปรันสคริป Jenkins-install.ssh
วิธีเช็ค version Jenkins
cat /var/lib/jenkins/config.xml
