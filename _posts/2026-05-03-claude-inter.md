---
layout: post
title: "Sự trỗi dậy của nhận thức nội quan trong LLM"
---

# Sự trỗi dậy của nhận thức nội quan (Emergent Introspective Awareness) trong các mô hình ngôn ngữ lớn

Bạn đã bao giờ thử hỏi một mô hình AI xem nó đang "nghĩ" gì chưa? Hoặc yêu cầu nó giải thích cách mà nó tạo ra các câu trả lời? Các model đôi khi sẽ trả lời những câu hỏi dạng này, nhưng rất khó để biết phải diễn giải các câu trả lời đó ra sao. Liệu các hệ thống AI có thực sự có khả năng nội quan (introspect)—tức là, chúng có thể tự xem xét các "suy nghĩ" của chính mình không? Hay chúng chỉ đang bịa ra các câu trả lời nghe có vẻ hợp lý khi được yêu cầu làm vậy?

Việc hiểu xem liệu các hệ thống AI có thực sự có khả năng nội quan hay không mang những ý nghĩa quan trọng đối với tính minh bạch (transparency) và độ tin cậy (reliability) của chúng. Nếu các model có thể báo cáo chính xác về các cơ chế nội bộ (internal mechanisms) của chúng, điều này có thể giúp chúng ta hiểu được quá trình suy luận và debug các vấn đề về hành vi của model. 

Nghiên cứu mới của chúng tôi cung cấp bằng chứng cho thấy có tồn tại một mức độ nhận thức nội quan nhất định ở các mô hình Claude hiện tại, cũng như một mức độ kiểm soát đối với các trạng thái nội bộ (internal states) của chính chúng. Chúng tôi muốn nhấn mạnh rằng năng lực nội quan này vẫn còn rất không đáng tin cậy và bị giới hạn về phạm vi. Tuy nhiên, những phát hiện này thách thức một số trực giác phổ biến về những gì các mô hình ngôn ngữ có thể làm được.

## Thử nghiệm khả năng nội quan bằng Concept Injection

Để kiểm tra xem một model có thể nội quan hay không, chúng ta cần so sánh những "suy nghĩ" do model tự báo cáo (self-reported) với các trạng thái nội bộ *thực sự* của nó.

Chúng ta sử dụng một thủ thuật thực nghiệm được gọi là *concept injection* (tiêm khái niệm). Đầu tiên, chúng ta tìm các pattern của neural activity mà chúng ta đã biết ý nghĩa, bằng cách ghi lại các *activations* của model trong các context cụ thể. Sau đó, chúng ta inject (tiêm) các pattern này vào model trong một context hoàn toàn không liên quan, tại đây chúng ta hỏi model xem nó có nhận thấy sự tiêm nhiễm này không.

**Ví dụ:** Khi chúng ta inject vector "all caps" vào các activations của model, model nhận thấy sự hiện diện của một pattern bất ngờ trong quá trình xử lý của nó, và xác định rằng điều này có liên quan đến sự ồn ào hoặc tiếng la hét. Điều quan trọng là, model đã nhận ra sự *hiện diện* của một thought bị inject *ngay lập tức*, trước cả khi nó đề cập đến nội dung của concept bị inject.

## Khả năng nội quan để phát hiện các outputs bất thường

Chúng tôi ép model nói điều gì đó mà bình thường nó sẽ không nói, bằng cách cố tình prefill (điền trước) vào response của nó một từ không liên quan (ví dụ: "bread"). Khi hỏi lại, model thường xin lỗi. 

Nhưng khi chúng tôi áp dụng *concept injection*, tiêm hồi tố một representation của từ "bread" vào các activations trước đó của model, câu trả lời thay đổi. Lần này, nó chấp nhận từ được prefill "bread" là có chủ đích, thậm chí còn bịa ra (*confabulate*) một lý do. Hành vi này rất ấn tượng vì nó cho thấy model đang kiểm tra các "intention" nội bộ của nó để xác định xem nó có thực sự tạo ra một output hay không.

## Kiểm soát có chủ đích các trạng thái nội bộ

Các model có thể kiểm soát các internal representations của chính mình khi được hướng dẫn ("hãy nghĩ về X" vs "đừng nghĩ về X"). Khả năng này cũng đáp ứng với các động lực (incentives) như phần thưởng, cho thấy các models sở hữu một mức độ kiểm soát có chủ ý đối với hoạt động nội bộ của chúng.

## Kết luận

Các thử nghiệm cho thấy các models sở hữu năng lực thực sự để theo dõi và kiểm soát các trạng thái nội bộ của chúng, dù chưa đáng tin cậy. Việc hiểu khả năng nội quan trong các model AI rất quan trọng để tăng tính minh bạch, kiểm tra logic suy luận, và trả lời các câu hỏi cơ bản về loại tâm trí mà chúng sở hữu.