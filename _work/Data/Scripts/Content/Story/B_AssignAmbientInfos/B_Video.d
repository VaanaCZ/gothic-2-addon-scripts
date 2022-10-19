// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Ein einzelner Gefangener hatte das Schicksal von hunderten geändert.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Aber er zahlte dafür einen hohen Preis...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Er hatte den Schläfer besiegt, die Barriere zerstört...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //...doch während alle anderen Gefangenen entkamen, blieb er in den Trümmern zurück...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Ich war es, der ihn gegen den Schläfer endsandte.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //Ich bin es jetzt, der ihn von dort zurückholt.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Er ist schwach, und er hat vieles vergessen.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Aber er ist am leben...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Er ist - zurück!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //Natürlich ist er noch am Leben. Was glaubst du denn?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Wollen wir es hoffen...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //Spürst du das?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Was?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Der Boden...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(verwundert) Xardas! Was ...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(murrt) Jetzt nicht...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(schreit fanatisch) Ich bin bereit... erwähle mich! Jaaa...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(zu sich selbst) Wo ist er hin?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(zitiert) Und der Mensch erschlug das Tier und es ging ein in Beliars Reich...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardas! Was genau ist im Tempel von Irdorath passiert?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //Du hast mit Innos Hilfe den Avatar des Bösen besiegt.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //Und ich habe seine Macht in mir aufgenommen...
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Seit ich den Kreis des Feuers verlassen habe, hatte ich nur dieses eine Ziel.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Um es zu erreichen habe ich dir geholfen, deine Bestimmung zu erfüllen.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Was mir im Tempel des Schläfers verwehrt blieb, ist nun endlich geschehen.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar hat mich erwählt.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Dann gehorchst du jetzt dem Gott der Finsternis?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Nein. Ich gehorche genauso wenig Beliar, wie du Innos gehorchst!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Nicht einmal die Götter wissen, was das Schicksal für uns bereit hält...
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //Und ich beginne gerade erst zu begreifen, welche Möglichkeiten sich mir eröffnen...
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Aber eins steht fest. Wir WERDEN uns wiedersehen...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(ruft) Wir legen ab!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(Späht in die Ferne, sieht was) hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(murmelt) Oh, Scheiße!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(gequältes Husten, Würgen) - (diverse)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh! (diverse)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(Langezogener Todesschrei, 4 Sekunden)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Schließt das Tor!!! (diverse)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Haltet sie auf!!! (diverse)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh! (diverse)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Wir sind überladen. Wir müssen was von dem Gold über Bord werfen.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Finger weg von dem Gold!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Hör zu, es wäre wirklich besser, wenn wir...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Ich will nichts mehr davon hören...
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Ich habe gehört, der Krieg mit den Orks steht schlecht...
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //Und?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Wir werden das ganze Gold vermutlich nirgendwo ausgeben können...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //Das Gold bleibt an Bord!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //Was nützt uns das Gold, wenn wir beim kleinsten Sturm kentern?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Ich sehe aber keinen Sturm...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //NOCH nicht...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Entspann dich! Alles wird gut!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(erstaunt) ... Menschen?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(abfällig) Menschen sind schwach.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(abfällig) Nur allzu leicht erliegen sie den Verlockungen des Bösen.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //Dabei lassen sie sich mit Mächten ein, die sie nicht verstehen, geschweige denn kontrollieren können.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Jene, die standhaft im Glauben sind, haben den Kampf gegen den Feind bereits begonnen.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Nach dem Fall der Barriere und der Verbannung des Schläfers ist Beliars Zorn noch größer geworden!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Ein mächtiges Artefakt, so steht es in den alten Schriften, wird wieder auf diese Welt zurückgeholt werden.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(zitiert) 'Wenn der Gott der Finsternis seine Schergen auf die Suche schickt'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //Und genau das ist geschehen. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //Diese Suche - hat längst begonnen!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Beliars Schergen entweihen bei ihrer Suche die ältesten Heiligtümer der Götter.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Beliars Schergen entweihen die ältesten Heiligtümer der Götter.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //Die Wächter dieser heiligen Orte sind erwacht. Und ihr Zorn - läßt die Erde erbeben!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Alle mächtigen Magier auf dieser Insel spüren diesen Zorn. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //Und einige von ihnen sind mit Sicherheit schon dabei, der Bedrohung entgegenzutreten.
};
