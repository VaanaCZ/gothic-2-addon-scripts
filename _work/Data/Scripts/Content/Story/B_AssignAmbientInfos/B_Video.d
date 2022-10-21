// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Ein einzelner Gefangener hatte das Schicksal von hunderten ge�ndert.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Aber er zahlte daf�r einen hohen Preis...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Er hatte den Schl�fer besiegt, die Barriere zerst�rt...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //...doch w�hrend alle anderen Gefangenen entkamen, blieb er in den Tr�mmern zur�ck...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Ich war es, der ihn gegen den Schl�fer endsandte.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //Ich bin es jetzt, der ihn von dort zur�ckholt.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Er ist schwach, und er hat vieles vergessen.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Aber er ist am leben...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Er ist - zur�ck!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //Nat�rlich ist er noch am Leben. Was glaubst du denn?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Wollen wir es hoffen...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //Sp�rst du das?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Was?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Der Boden...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(verwundert) Xardas! Was ...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(murrt) Jetzt nicht...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(schreit fanatisch) Ich bin bereit... erw�hle mich! Jaaa...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(zu sich selbst) Wo ist er hin?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(zitiert) Und der Mensch erschlug das Tier und es ging ein in Beliars Reich...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardas! Was genau ist im Tempel von Irdorath passiert?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //Du hast mit Innos Hilfe den Avatar des B�sen besiegt.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //Und ich habe seine Macht in mir aufgenommen...
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Seit ich den Kreis des Feuers verlassen habe, hatte ich nur dieses eine Ziel.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Um es zu erreichen habe ich dir geholfen, deine Bestimmung zu erf�llen.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Was mir im Tempel des Schl�fers verwehrt blieb, ist nun endlich geschehen.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar hat mich erw�hlt.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Dann gehorchst du jetzt dem Gott der Finsternis?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Nein. Ich gehorche genauso wenig Beliar, wie du Innos gehorchst!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Nicht einmal die G�tter wissen, was das Schicksal f�r uns bereit h�lt...
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //Und ich beginne gerade erst zu begreifen, welche M�glichkeiten sich mir er�ffnen...
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Aber eins steht fest. Wir WERDEN uns wiedersehen...
	
	// ------ Outro Xardas Kapit�n ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(ruft) Wir legen ab!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(Sp�ht in die Ferne, sieht was) hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(murmelt) Oh, Schei�e!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(gequ�ltes Husten, W�rgen) - (diverse)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh! (diverse)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(Langezogener Todesschrei, 4 Sekunden)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Schlie�t das Tor!!! (diverse)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Haltet sie auf!!! (diverse)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh! (diverse)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Wir sind �berladen. Wir m�ssen was von dem Gold �ber Bord werfen.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Finger weg von dem Gold!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //H�r zu, es w�re wirklich besser, wenn wir...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Ich will nichts mehr davon h�ren...
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Ich habe geh�rt, der Krieg mit den Orks steht schlecht...
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //Und?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Wir werden das ganze Gold vermutlich nirgendwo ausgeben k�nnen...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //Das Gold bleibt an Bord!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //Was n�tzt uns das Gold, wenn wir beim kleinsten Sturm kentern?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Ich sehe aber keinen Sturm...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //NOCH nicht...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Entspann dich! Alles wird gut!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(erstaunt) ... Menschen?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(abf�llig) Menschen sind schwach.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(abf�llig) Nur allzu leicht erliegen sie den Verlockungen des B�sen.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //Dabei lassen sie sich mit M�chten ein, die sie nicht verstehen, geschweige denn kontrollieren k�nnen.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Jene, die standhaft im Glauben sind, haben den Kampf gegen den Feind bereits begonnen.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Nach dem Fall der Barriere und der Verbannung des Schl�fers ist Beliars Zorn noch gr��er geworden!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Ein m�chtiges Artefakt, so steht es in den alten Schriften, wird wieder auf diese Welt zur�ckgeholt werden.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(zitiert) 'Wenn der Gott der Finsternis seine Schergen auf die Suche schickt'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //Und genau das ist geschehen. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //Diese Suche - hat l�ngst begonnen!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Beliars Schergen entweihen bei ihrer Suche die �ltesten Heiligt�mer der G�tter.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Beliars Schergen entweihen die �ltesten Heiligt�mer der G�tter.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //Die W�chter dieser heiligen Orte sind erwacht. Und ihr Zorn - l��t die Erde erbeben!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Alle m�chtigen Magier auf dieser Insel sp�ren diesen Zorn. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //Und einige von ihnen sind mit Sicherheit schon dabei, der Bedrohung entgegenzutreten.
};
