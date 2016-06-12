# ibus-table-vietnamese

Do cả `ibus-unikey` và `ibus-bogo` đều rất buggy nên mình phát triển hai bảng
gõ này dùng tạm.

## Cài đặt

1. Cài đặt `ibus-table` nếu bạn chưa cài.
2. Dùng `git` clone `ibus-table-vietnamese` hoặc tải tệp ZIP ở **Clone or
   download** rồi giải nén. Sau đấy `cd` vô thư mục đó.
3. Dịch database từ mã nguồn:<pre>
    ```    
    ibus-table-createdb --name=tables/vni.db --source=tables/vni.txt
    ibus-table-createdb --name=tables/telex.db --source=tables/telex.txt
    ```</pre>
4. Giả định `DATADIR` là `/usr/share`. Sao chép các tệp cần thiết vô
   `${DATADIR}/ibus-table/`:<pre>
    ```
    sudo cp tables/telex.db tables/vni.db ${DATADIR}/ibus-table/tables
    sudo cp icons/vietnamese.png ${DATADIR}/ibus-table/icons
    ```</pre>
5. Khởi động lại `ibus-deamon` bằng lệnh `ibus-daemon -drx`.
6. Chạy `ibus-setup`. Trong tab **Input Method** chọn *Add, Vietnamese, Telex*
   hoặc *VNI* rồi chọn *Add*.

## Phương thức gõ

Để đơn giản hoá vấn đề, các bộ gõ này tuân theo một vài quy luật sau, mà các
bạn có thể gọi là dị, hoặc bất tiện, tuỳ các bạn, cơ mà mình mong nó vẫn hữu
ích ở một mữc độ nhất định:

* Chỉ gõ từng kí tự, dấu chữ cái trước, dấu của tiếng sau, ví dụ như để gõ từ
  *nện* trong VNI, bạn gõ `ne65n` - các cách gõ khác đều không cho kết quả như
  mong muốn.
* Với kiểu gõ Telex, bạn cần gõ ***tất cả*** các chữ cái hoa để có được kí tự
  in hoa. Điều này giúp bảng gõ đơn giản mà vẫn gõ được khi bật *Caps Lock*, ví
  dụ *Ừ* được gõ bằng `UWF`. Đơn giản hơn đến mức độ nào à, ừm, gần 5 lần. Có
  37 kí tự được gõ từ 2, phím, 30 từ 3. Kí tự gõ từ 2 phím có 3 cách khác nhau,
  3 phím có 7 cách. Mà bạn biết là mình xây dựng các bảng gõ này bằng tay nên
  chẳng có lí do gì để làm phức tạp hoá vấn đề lên cả không phải do mình lười,
  mình có lười thật, cơ mà nếu do người làm thì bảng gõ càng dài sẽ càng tiềm
  ẩn lỗi.
* Lại với kiểu gõ Telex, mình cho thêm kí tự thoát `\` của VNI vô, bỏ đi thao
  tác sửa lỗi kiểu `ooo` để gõ `oo` rất nhập nhằng. Ví dụ như để gõ từ *Đoòng*,
  bạn gõ `DDo\ofng`. Cảm ơn mình sau khi phải gõ từ có âm *ôô*. Nhân tiện mình
  cũng bỏ luôn việc dùng `z` để huỷ dấu. Simple Telex (cả v1 và v2, là cái
  `w[]{}` ấy) đều không được hỗ trợ.

## Lưu ý khi dùng Vim

`ibus-table` k tương thích với Vim, vì vậy mình đã lập 2 keymap tương tự, [đã
được merge vô repo chính](https://github.com/vim/vim/tree/master/runtime/keymap).
Trong `vimrc` bạn thêm mấy dòng sau:<pre>
    """
    set keymap=vietnamese-telex " hoặc vietnamese-vni
    " Tắt keymap và ibus khi khởi động Vim
    set imdisable iminsert=0 imsearch=-1
    """</pre>
