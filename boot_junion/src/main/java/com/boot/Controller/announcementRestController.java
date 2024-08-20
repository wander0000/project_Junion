package com.boot.Controller;

import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.boot.DTO.announcementsBoardDTO;
import com.boot.Service.announcementsBoardService;

import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/announcementRest")
public class announcementRestController {

    @Autowired
    private announcementsBoardService boardService;

    @ResponseBody
    @GetMapping(value = "/data", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, Object>> getList() {
        log.info("Fetching announcements list");
        List<announcementsBoardDTO> announcements = boardService.boardList();
        Map<String, Object> result = new HashMap<>();
        result.put("result", Boolean.TRUE);
        result.put("data", announcements);
        log.info("Announcements list fetched successfully");
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping(value = "/data/{board_no}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<announcementsBoardDTO> getAnnouncementById(@PathVariable int board_no) {
        log.info("Fetching announcement with board_no: {}", board_no);
        announcementsBoardDTO announcement = boardService.findByBoardno(board_no);
        if (announcement != null) {
            log.info("Announcement found: {}", announcement);
            return ResponseEntity.ok(announcement);
        } else {
            log.warn("Announcement with board_no: {} not found", board_no);
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{board_no}")
    public ResponseEntity<Void> deleteAnnouncement(@PathVariable("board_no") int boardNo) {
        try {
            boardService.boardDelete(boardNo);
            log.info("Announcement with board_no: {} deleted successfully", boardNo);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            log.error("Error deleting announcement with board_no: {}", boardNo, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("")
    public ResponseEntity<Map<String, Object>> writeAnnouncement(@RequestBody announcementsBoardDTO boardDTO) {
        log.info("Writing new announcement: {}", boardDTO);
        Map<String, Object> result = new HashMap<>();
        try {
            boardService.boardWrite(boardDTO);
            result.put("result", Boolean.TRUE);
            log.info("Announcement written successfully");
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            log.error("Error writing announcement", e);
            result.put("result", Boolean.FALSE);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
        }
    }
    
    @PutMapping("/{board_no}")
    public ResponseEntity<Map<String, Object>> updateAnnouncement(
            @PathVariable("board_no") int boardNo,
            @RequestBody Map<String, String> param) {
    	log.info(param+"파람");
    	log.info(boardNo+"파람");

        // boardNo를 파라미터에 추가
        param.put("board_no", String.valueOf(boardNo));

        Map<String, Object> result = new HashMap<>();

        
        try {
            boardService.boardModify(param);
            result.put("result", Boolean.TRUE);
            log.info("Announcement written successfully");
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            log.error("Error writing announcement", e);
            result.put("result", Boolean.FALSE);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
        }
    }
    
    

    @RequestMapping("")
    public String announcementsBoard() {
        return "announcementsBoard";
    }

    @RequestMapping("/{board_no}")
    public String announcementsDetailView() {
        return "announcementsBoardDetailView";
    }

}
