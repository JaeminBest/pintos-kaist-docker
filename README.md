# pintos-kaist-docker

### update log

- 2020.03.24 : 2002 spring 버전으로 새롭게 만듦

### Quick Start

```bash
### start.sh에서 PINTOS_PATH를 자신의 pintos-kaist 레포 절대 경로로 변경해야함!
$ source start.sh (매 새로운 terminal을 열 때마다 실행해줘야 함, alias가 안되어 있기 때문)
$ pintos bash
root@blahblah: /pintos-kaist# source activate
root@blahblah: /pintos# (type command here)
```

`source start.sh`를 하면 docker container를 리셋하고 다시 시작함.  
GDB를 사용하려면 2개 터미널을 열고 둘 다 `source start.sh` 커맨드를 입력해야함.

### Run via Original Pintos-way (2020.02.18 추가)

이 방법을 권장함. (Pintos documenation에 나와 있는 커맨드 모두 작동)

```bash
$ pintos bash
root@blahblah: /pintos# (type command here)
```

### Run via Aliasing Command

- `pintos start` (Starts the Docker container)
- `pintos stop` (Stops the Docker container)
- `pintos bash`

in anywhere without accessing to docker directly.

For example, if you want to see a grade for `userprog` project, just do:

```bash
$ pintos grade userprog && vim <your-pintos-dir>/src/userprog/build/grade
```

**Note:** `pintos help` would print the help message.

**Note:** Adding your account to `docker` group makes you can use this without
`sudo`.

### Pintos Guidline

(1) build 방법

```bash
/path/to/pintos/src/<target-dir>$ make
```

이렇게 했을 때, target-dir 밑에 build 디렉토리가 새롭게 생성됨.

(2) 실행 방법

```bash
/path/to/pintos/src/<target-dir>/build$ pintos run alarm-multiple (단일 테스트)
```

만약 X-server 에러가 나오고 alram-multiple test가 실행되지 않는다면 아래 커맨드를 입력한다.

```bash
/path/to/pintos/src/<target-dir>/build$ pintos -v -- run alarm-multiple
```

(3) 실행 옵션 변경  
`--qemu` 옵션이 추가될 때 : Qemu 시뮬레이터 사용
`--boch` 혹은 아무 옵션 없을 때 : Boch 시뷸레이터 사용  
Qemu는 속도가 빠르지만 `-r` 옵션의 디버깅 테스트밖에 실행 불가, Boch는 느린대신 `-j`(Reproducibility test), `-r` 둘다 실행 가능

(4) 테스팅

```bash
/path/to/pintos/src/<target-dir>/build$ make check (SIMULATOR=--bochs/--qemu, optional)
```

다중 테스트의 경우, VERBOSE, PINTOSOPTS와 같은 arument를 통해 테스트 옵션을 변경할 수 있다.

```bash
/path/to/pintos/src/<target-dir>/build$ make tests/threads/alarm-multiple.result (단일 테스트)
```

단일 테스트의 경우, make 커맨드의 argument로 들어간 .result 파일에 결과가 저장된다 (PASS/FAIL)

(5) 다시 시작

```bash
/path/to/pintos/src/<target-dir>/build$ make clean
```
