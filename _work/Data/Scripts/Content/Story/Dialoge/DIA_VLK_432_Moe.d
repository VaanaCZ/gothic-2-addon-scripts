///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Moe_EXIT   (C_INFO)
{
	npc         = VLK_432_Moe;
	nr          = 999;
	condition   = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Moe_PICKPOCKET (C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 900;
	condition	= DIA_Moe_PICKPOCKET_Condition;
	information	= DIA_Moe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 30);
};
 
FUNC VOID DIA_Moe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Moe_PICKPOCKET);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_BACK 		,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
	
func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
// ************************************************************
// 			     Hallo
// ************************************************************
INSTANCE DIA_Moe_Hallo(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 2;
	condition	= DIA_Moe_Hallo_Condition;
	information	= DIA_Moe_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       

FUNC INT DIA_Moe_Hallo_Condition()
{	
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Moe_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Hey, ich kenne dich nicht. Was willst du hier? Willst du in die Kneipe?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Nein, ich will nicht in die Kneipe...(ENDE)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Ach das hier ist die Kneipe... ",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Ja, hast du was dagegen?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //Nein, ich will nicht in die Kneipe ...
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Ja, das hätte ich jetzt auch gesagt. Aber das ist nicht wichtig - und deshalb können wir direkt zum Geschäft kommen.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Da du neu hier bist, mache ich dir ein Angebot. Du gibst mir 50 Goldstücke und kannst gehen.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //Das ist dein Eintrittspreis für die Kneipe.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Wir können ja mal sehen, was die Miliz dazu sagt...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Vergiss es, du kriegst nicht ein Goldstück!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Okay, ich bezahle.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Aber, ich will nicht in die Kneipe!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Aber, ich will nicht in die Kneipe!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //Weißt du, früher oder später will jeder mal in die Kneipe. Also kannst du auch direkt bezahlen - dann hast du es hinter dir.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Ach, das hier ist die Hafenkneipe. Ich dachte schon, das wäre das Haus des Statthalters.
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Hey - spar dir deine schlechten Sprüche, Kleiner, sonst schmeckst du gleich den Staub der Straße.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ich sehe schon, ich muss dich wohl verprügeln,...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Willst du mir Ärger machen?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Reg dich nicht auf, ich will nur ein Bier trinken.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Aber, ich will nicht in die Kneipe!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Ja, hast du was dagegen?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Du hast hier nichts verloren, Kleiner.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ich sehe schon, ich muss dich wohl verprügeln,...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Willst du mir Ärger machen?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Reg dich nicht auf, ich will nur ein Bier trinken.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Wir können ja mal sehen, was die Miliz dazu sagt ...
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //(lacht) Die Miliz ist nicht hier. Und weißt du auch, warum sie nicht hier ist?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Das hier ist das Hafenviertel, Kleiner. Hier wird sich keiner von der Miliz mit mir anlegen.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //Die gehen höchstens in die 'Rote Laterne'. Du siehst, wir sind ganz unter uns. (grinst dreckig)
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Ich sehe schon, ich muss dich wohl verprügeln, damit ich weiterkomme.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Das kannst du ja gerne mal probieren, Kleiner. Zeig mir was du kannst!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Willst du mir Ärger machen?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Klar, ich bin Meister im Ärger machen. Also wehr dich, Kleiner.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Reg dich nicht auf, ich will nur ein Bier trinken.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Okay, aber der Eintritt kostet dich 50 Goldstücke. (grinst)
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Vergiss es, du kriegst nicht ein Goldstück!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Okay, ich bezahle.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //Okay, ich bezahle.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Na gut. Und weil das so gut geklappt hat, zahlst du mir jetzt noch den Rest, den du dabei hast.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Vergiss es, du kriegst nicht ein Goldstück!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Okay, hier ist alles was ich habe.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //... aber ich hab so viel Gold gerade nicht bei mir.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //Das macht nichts. Dann gib mir einfach alles, was du dabei hast.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Vergiss es, du kriegst nicht ein Goldstück!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Okay, hier ist alles was ich habe.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //... aber ich habe nicht mal 10 Goldstücke dabei.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Mann, da habe ich mir ja den richtigen ausgesucht.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //Na schön - seufz - du kannst gehen.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Vergiss es, du kriegst nicht ein Goldstück!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Dann nehme ich mir halt alles, was du hast - sobald du im Staub vor mir liegst.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Okay, hier ist alles, was ich habe.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Also gut, das reicht mir. Ich bin ja großzügig. (grinst)
	AI_StopProcessInfos (self);
};
//************************************************
//	Das Hafenviertel
//************************************************

INSTANCE DIA_Moe_Harbor(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 998;
	condition	= DIA_Moe_Harbor_Condition;
	information	= DIA_Moe_Harbor_Info;
	permanent	= TRUE;
	description = "Du kennst dich hier im Hafen aus, oder?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Du kennst dich hier im Hafen aus, oder?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Klar doch. Wieso?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"Wie läuft der Schiffsverkehr?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Wieso sehe ich hier keine Miliz?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"Was sind denn für Gerüchte im Umlauf?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Wie läuft der Schiffsverkehr?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //Das einzige Schiff, das in letzter Zeit hier angekommen ist, ist das Schiff der Paladine.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Es legte drüben hinter dem Felsrücken im Südwesten an.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Wieso sehe ich keine Miliz?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //Die traut sich hier nicht hin. Wir nehmen die Sachen selbst in die Hand.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //Was sind denn für Gerüchte im Umlauf?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //Wir mögen es hier nicht, wenn zu viele Fragen gestellt werden. Besonders nicht von Fremden.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Nichts, was soll es schon geben. Hier ist alles ruhig.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //(gekünstelt) Es ist schlimm. Die Zeiten sind hart und wir alle versuchen, auf dem Pfad der Tugend zu bleiben.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Verarsch mich nicht.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Wie kannst du nur so etwas von mit denken, ich fühle mich zutiefst gekränkt.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Die Lage ist ziemlich heiß. Lord Andre versucht seit einiger Zeit, seine Nase in Dinge zu stecken, die ihn nichts angehen.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Die feinen Pinkel werden nie verstehen, wie das hier unten läuft.
		};
		
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //Wir haben mit der Sache nichts zu tun.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //Mit welcher Sache?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //Mit diesem Paladin, den sie oben ermordet haben. Ihr solltet euch echt besser um die Söldner kümmern, als hier eure Zeit zu vergeuden.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //Ich weiß, du hast mit der Sache nichts zu tun, aber der Mord an dem Paladin hat die feinen Herrschaften echt aufgeschreckt.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Wenn du einen Rat unter Freunden haben willst, verschwinde aus der Stadt. Zumindest für einige Zeit.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Seit raus ist, dass nicht die Söldner den Paladin erledigt haben, trauen sich die Milizen gar nicht mehr hier hin.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //Schätze, die haben Angst vor ein paar blutigen Nasen. Mir soll's recht sein.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Hier ist absolut tote Hose.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Endlich verschwinden die aufgeblasenen Paladine aus dem Hafen. Wird auch Zeit.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_432_Moe;
	nr			 =  2;
	condition	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Moe_LEHMARGELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //Hey, du! Schöne Grüße von Lehmar.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







