package com.allofus.holburne.learningzone.view.chapter.chapter09
{
	import com.allofus.holburne.learningzone.view.component.ImageAndTextSlide;
	import com.allofus.holburne.learningzone.view.component.ImageWithBorderAndCaption;
	import com.allofus.holburne.learningzone.view.component.TextBoxWithTitleAndDescription;
	import com.holburne.learningzone.swc.chapter9.Img_9_3_3;

	import flash.display.Bitmap;

	/**
	 * @author jc
	 */
	public class Slide_9_3_3VC extends ImageAndTextSlide
	{

		public function Slide_9_3_3VC()
		{
			var caption:String = 
				"<p><span class='imageCaptionItalic'>Thomas Gainsborough (1727-1788)</span><span class='imageCaption'></span></p>"
			+	"<p class='imageCaption'>David Garrick</p>"
			+	"<p class='imageCaption'>Oil on canvas, 1770-71</p>"
			+	"<p class='imageCaption'>81.5 x 76 cm</p>"
			+	"<p class='imageCaption'>Private Collection</p>";
			img = new ImageWithBorderAndCaption(new Bitmap(new Img_9_3_3(0,0)), caption);
			addChild(img);
			
			
			var title:String ="DAVID GARRICK (1717-1779)";
			var description:String = 
				"<p class='justified'>Actor, manager and writer David Garrick (1717–1779) transformed the art and profession of the actor.  Brought up in Lichfield, he arrived in London with his schoolmaster Samuel Johnson and set up as a wine merchant with his brother.  In London, Garrick was stage-struck.  His first involvement with the theatre was as a playwright: his satirical comedy Lethe was performed at the Theatre Royal, Drury Lane in 1740 and became a popular vehicle for its leads Kitty Clive and Henry Woodward.</p>"
			+	"<p></p>"
			+	"<p class='justified'>His sensational acting debut as Shakespeare’s Richard III caused a traffic jam and made him a star overnight.  Within seven years, he had bought the theatre on Drury Lane and, as manager, single-handedly raised the social status of the actor.  He enforced rehearsals and brought order to the dressing room, once the scene of brawls and cat fights.  It was not only his skill at humanising tragic characters that brought audiences flocking to his performances, but also his comic genius.  A contemporary wrote:</p>"
			+	"<p></p>"
			+	"<p class='justified'>‘d__n him!  He could act a gridiron!’</p>"
			+	"<p></p>"
			+	"<p class='justified'>David Garrick's success made him and his Viennese wife Eva Maria immensely rich.  They lived in luxurious residences, spent holidays in Bath, and were welcomed into aristocratic, literary and artistic circles.  He was painted by some of the greatest artists of the century.  Gainsborough, Hogarth, Reynolds and Zoffany vied to capture his elusive genius on canvas.  Garrick encouraged them to paint him and publish prints copied from the paintings, knowing it was good publicity both for himself and the artists.  When he visited Paris in 1765, he was flattered to find that even in France people were demanding his portrait.  He wrote to his brother to ask him to send copies of his favourite prints, including ‘Jaffier & Belvidera by Zoffani’.</p>"
			+	"<p></p>"
			+	"<p class='justified'>Garrick was the first actor to be honoured with burial in Westminster Abbey.  His genius was immortalised by some of the greatest painters in the history of British art.</p>";
			text = new TextBoxWithTitleAndDescription(title, description);
			addChild(text);
			
			super();
		}
	}
}
