package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter15Model extends AbstractChapterModel
	{
		public function Chapter15Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"15_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Cup in Detail</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Details</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"15_2_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Video</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"15_2_2"})
					]})
			);

			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Other examples</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Other examples</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"15_3_1"})
					]})
			);
			
			super();
		}
		
		
	}
}
