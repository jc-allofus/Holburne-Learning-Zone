package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter10Model extends AbstractChapterModel
	{
		public function Chapter10Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Artist</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Biography</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Sitters</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Who are they?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Where did they live?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_3_2"})
				]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Costumes</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_4_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Meanings</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_4_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Conversation Peices</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_4_3"}),
					new ButtonVO({label:"<p class='buttonLabel'>The Frame</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"10_4_4"})
				]})
			);
			
			super();
		}
		
		
	}
}
