//*********************************************************************
//	Info EXIT 
//********************************************************************
INSTANCE DIA_Cornelius_Exit   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 999;
	condition   = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent   = TRUE;
	description	= DIALOG_ENDE;
};

FUNC INT DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos (self);
};

//############################
//##						##			
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	SeeMurder 
//********************************************************************
INSTANCE DIA_Cornelius_SeeMurder   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent   = FALSE;
	description	= "Widzia�e� zab�jstwo Lothara, prawda?";
};

FUNC INT DIA_Cornelius_SeeMurder_Condition()
{
	if (RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_SeeMurder_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_SeeMurder_15_00"); //Widzia�e� zab�jstwo Lothara, prawda?
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_01"); //Nie musz� odpowiada� na �adne pytania dotycz�ce �ledztwa w toku.
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_02"); //Lord Hagen wie ju� o wszystkim.
};

//*********************************************************************
//	Was hast du gesehen? 
//********************************************************************
INSTANCE DIA_Cornelius_WhatYouSee   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 5;
	condition   = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent   = FALSE;
	description	= "Co widzia�e�?";
};

FUNC INT DIA_Cornelius_WhatYouSee_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_SeeMurder)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_WhatYouSee_15_00"); //Co widzia�e�?
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_01"); //Naprawd�, nie mam teraz czasu.
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_02"); //Musisz wyj��, zamykamy biuro.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius nie chce ze mn� rozmawia�."); 
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Jetzt reicht es! Was hast du gesehen?
//********************************************************************
INSTANCE DIA_Cornelius_Enough   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 6;
	condition   = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent   = FALSE;
	description	= "Do�� tego! Co widzia�e�?";
};

FUNC INT DIA_Cornelius_Enough_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_WhatYouSee)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Enough_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_00"); //Do�� tego! Co widzia�e�?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_01"); //Ja... widzia�em, jak najemnik zaatakowa� paladyna od ty�u.
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_02"); //A potem wyj�� miecz i wbi� mu go w klatk� piersiow�.
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_03"); //Jeste� tego pewien?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_04"); //Tak, oczywi�cie, widzia�em to na w�asne oczy.
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_05"); //Ale teraz naprawd� nie mam czasu, przede mn� ca�a masa papierkowej roboty.

	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Ich glaube dir nicht.
//********************************************************************
INSTANCE DIA_Cornelius_DontBelieveYou   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent   = TRUE;
	description	= "Nie wierz� ci.";
};

FUNC INT DIA_Cornelius_DontBelieveYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_Enough)
	&& Cornelius_TellTruth != TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_15_00"); //Nie wierz� ci.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_13_01"); //No i co, powiedz mi, co zamierzasz z tym zrobi�?

	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
	//hier fehlt noch Taschendiebstahl
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Czego chcesz?",DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Cenisz chyba w�asne �ycie, prawda?",DIA_Cornelius_DontBelieveYou_WantSurvive);
	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"W klasztorze z pewno�ci� nak�oni� ci� do m�wienia.",DIA_Cornelius_DontBelieveYou_Monastery);
	};
	if (hero.guild == GIL_SLD)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"M�g�bym powiedzie� najemnikom, gdzie mieszkasz.",DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};
	if (hero.guild == GIL_MIL)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Za krzywoprzysi�stwo mo�esz trafi� do paki - i to na d�ugi czas!",DIA_Cornelius_DontBelieveYou_Perjury);
	};
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WhatYouWant ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00"); //Czego chcesz?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01"); //Nawet nie starczy ci z�ota, �eby mi zap�aci�.
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02"); //Ile?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03"); //2000 sztuk z�ota. Hm, to mog�oby mnie sk�oni� do przemy�lenia tej kwestii ponownie.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius zgodzi si� ze mn� porozmawia� za 2000 sztuk z�ota.");
	
	Cornelius_PayForProof = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WantSurvive ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00"); //Cenisz chyba w�asne �ycie, prawda?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01"); //Je�li mnie zaatakujesz, zawi�niesz na stryczku.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02"); //Mam wp�ywowych przyjaci�. Spr�buj mnie tylko tkn��, a po�a�ujesz.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03"); //Wyno� si� st�d! Albo wezw� stra�nik�w!
	
	
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_00"); //W klasztorze z pewno�ci� nak�oni� ci� do m�wienia.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01"); //Co to ma niby znaczy�?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_02"); //Mamy swoje sposoby na poznanie prawdy. Bolesne sposoby.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03"); //Nie, prosz�, nie r�b tego. Powiem wszystko, co zechcesz.
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00"); //M�g�bym powiedzie� najemnikom, gdzie mieszkasz.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01"); //Co to ma niby znaczy�?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02"); //Jestem pewien, �e z wielk� ch�ci� ci� odwiedz�. Zapewne nie b�d� bardzo mili.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03"); //Nie mo�esz tego zrobi�, zabij� mnie.
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04"); //To bardzo prawdopodobne.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05"); //Powiem, co tylko zechcesz, ale nie r�b tego.
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Perjury_15_00"); //Za krzywoprzysi�stwo mo�esz trafi� do paki - i to na d�ugi czas!
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01"); //Pr�bujesz mnie zastraszy�? Jaki� stra�nik grozi sekretarzowi gubernatora?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02"); //Je�li natychmiast nie opu�cisz tego miejsca, dopilnuj�, aby ci� zdegradowano.
	
	Cornelius_ThreatenByMilSC = TRUE;
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Hier ist das Geld
//********************************************************************
INSTANCE DIA_Cornelius_PayCornelius   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent   = TRUE;
	description	= "Oto z�oto.";
};

FUNC INT DIA_Cornelius_PayCornelius_Condition()
{
	if Cornelius_PayForProof == TRUE
	&& (Npc_HasItems (other,ItMi_Gold) >= 2000)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_PayCornelius_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_PayCornelius_15_00"); //Tu jest z�oto.
	
	B_GiveInvItems (other,self ,ItMi_Gold,2000);
	
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_01"); //Lepiej, �ebym nie wiedzia�, sk�d to wzi��e�.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_02"); //Szczerze m�wi�c, to mnie nie obchodzi.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_03"); //Ale mamy pewien interes do za�atwienia.
	
	Cornelius_TellTruth = TRUE;
};


//*********************************************************************
//	Was ist wirklich passiert?
//********************************************************************
INSTANCE DIA_Cornelius_RealStory   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent   = TRUE;
	description	= "Wi�c co tak naprawd� si� wydarzy�o?";
};

FUNC INT DIA_Cornelius_RealStory_Condition()
{
	if Cornelius_TellTruth == TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_RealStory_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_00"); //Wi�c co tak naprawd� si� wydarzy�o?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_01"); //Nie widzia�em, co zasz�o. Dosta�em z�oto za obci��enie win� najemnika.
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_02"); //W dzisiejszych czasach ka�dy musi zadba� o siebie. Potrzebowa�em pieni�dzy.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_03"); //Kto ci zap�aci�?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_04"); //Wystarczy. Zabije mnie, je�li go wydam.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_05"); //Czy zgodzisz si� powiedzie� to samo Lordowi Hagenowi?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_06"); //Nie jestem szalony. Nie mog� zosta� w mie�cie.
	
	if (Npc_HasItems (self,ItWr_CorneliusTagebuch_Mis) >=1)
	{
		AI_Output (self ,other,"DIA_Cornelius_RealStory_13_07"); //Dam ci m�j pami�tnik, powinien by� wystarczaj�cym dowodem.
		B_GiveInvItems (self,other,ItWr_CorneliusTagebuch_Mis,1);
	};
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius k�ama�. Zap�acono mu za z�o�enie fa�szywych zezna�. Boi si� jednak powiedzie�, komu zale�a�o na obci��eniu win� Benneta.");
	
	CorneliusFlee = TRUE;
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FLEE");
};


//*********************************************************************
//	Auf der Flucht
//********************************************************************
INSTANCE DIA_Cornelius_Fleeing (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 1;
	condition   = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Cornelius_Fleeing_Condition()
{
	if (CorneliusFlee == TRUE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Fleeing_Info()
{
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cornelius_PICKPOCKET (C_INFO)
{
	npc			= VLK_401_Cornelius;
	nr			= 900;
	condition	= DIA_Cornelius_PICKPOCKET_Condition;
	information	= DIA_Cornelius_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tej ksi��ki b�dzie ryzykownym zadaniem)";
};                       

FUNC INT DIA_Cornelius_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_CorneliusTagebuch_Mis) >= 1)
	&&  (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff))
	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cornelius_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_BACK 		,DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItWr_CorneliusTagebuch_Mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
};
