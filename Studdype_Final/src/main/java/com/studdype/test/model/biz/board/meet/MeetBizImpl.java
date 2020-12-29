/*
 * package com.studdype.test.model.biz.board.meet;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.studdype.test.model.dao.board.meet.MeetBoardDao; import
 * com.studdype.test.model.dto.board.MeetDto;
 * 
 * @Service public class MeetBizImpl implements MeetBiz {
 * 
 * @Autowired private MeetBoardDao meet_dao;
 * 
 * @Override public List<MeetDto> meet_selectList() { return
 * meet_dao.meet_selectList(); }
 * 
 * @Override public MeetDto meet_selectOne(int meet_no) { return
 * meet_dao.meet_selectOne(meet_no); }
 * 
 * @Override public int meet_insert(MeetDto meet_dto) { return
 * meet_dao.meet_insert(meet_dto); }
 * 
 * @Override public int meet_update(MeetDto meet_dto) { return
 * meet_dao.meet_update(meet_dto); }
 * 
 * @Override public int meet_delete(int meet_no) { return
 * meet_dao.meet_delete(meet_no); }
 * 
 * }
 */