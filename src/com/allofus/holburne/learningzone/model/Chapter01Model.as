package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter01Model extends AbstractChapterModel
	{
		public function Chapter01Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Thomas Gainsborough</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>The Artist</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_2_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Other Work</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_2_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Where He Lived</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_2_3"}),
					new ButtonVO({label:"<p class='buttonLabel'>Photo of Model</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_2_4"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Byam Family</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>button label here...</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_3"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Painting</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>button label here...</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_4_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>button label here...</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_4_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>button label here...</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"1_4_3"})
					]})
			);
			
			super();
		}
		
		
	}
}
