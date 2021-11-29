import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key key}) : super(key: key);

  final String title = 'LayoutPage';

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final TextEditingController editTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    editTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hello world'),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: _buildReplyingView()),
      // bottomNavigationBar: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 300),
      //     child: _buildReplyingView()),
    );
  }

  Widget _buildReplyingView() {
    return Row(
      children: <Widget>[
        Expanded(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
              color: Color(0xFFEEEEEE),
              child: SizedBox(
                  child: TextField(
                      maxLength: 200,
                      controller: editTextController,
                      buildCounter: null,
                      onChanged: (value) {
                        // widget.model?.bottomReplyContent = value;
                      },
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                          hintText: '发表你的意见～',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xFF666666)),
                          hintMaxLines: 1,
                          counterText: '',
                          fillColor: Color(0xFFF5F6FA),
                          filled: true,
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16))))),
        )),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 5),
          child: Image(
              fit: BoxFit.fitWidth,
              width: 19,
              image: AssetImage("images/community_zan_icon.png")),
        ),
        Text(
          '214',
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 5),
          child: Image(
              fit: BoxFit.fitWidth,
              width: 19,
              image: AssetImage("images/community_comment.png")),
        ),
        Text(
          '214',
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 5),
          child: Image(
              fit: BoxFit.fitWidth,
              width: 16,
              image: AssetImage("images/question_detail_share_icon.png")),
        ),
        Text(
          '214',
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
