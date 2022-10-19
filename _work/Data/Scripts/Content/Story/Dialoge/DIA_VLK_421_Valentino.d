///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Valentino_EXIT   (C_INFO)
{
	npc         = VLK_421_Valentino;
	nr          = 999;
	condition   = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_HALLO		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 1;
	condition	= DIA_Valentino_HALLO_Condition;
	information	= DIA_Valentino_HALLO_Info;
	permanent 	= FALSE;
	description	= "No prosz�, co my tu mamy?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //No prosz�, co my tu mamy?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Nazywam si� Valentino. Staram si� nie splami� prac� kolejnego dnia ofiarowanego mi przez Innosa.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //Uwa�aj na s�owa.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Wybacz, Panie, nie mia�em nic z�ego na my�li.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //Czy nikt nie nauczy� ci� manier? To oburzaj�ce!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Ci�gle tylko ta paplanina. Nie powiniene� by� teraz w pracy?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //Ale, z drugiej strony, kt�by t�skni� za takim �mieciem, co?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //Gdyby� mia� tyle z�ota co ja, te� nie musia�by� pracowa�. Ty jednak nigdy nie b�dziesz tak bogaty.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Widz�, �e czeka mnie z tob� du�o dobrej zabawy.
	};
};

// ********************************************************
// 						WhoAgain
// ********************************************************

instance DIA_Valentino_WhoAgain		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 2;
	condition	= DIA_Valentino_WhoAgain_Condition;
	information	= DIA_Valentino_WhoAgain_Info;
	permanent 	= FALSE;
	description	= "Pyta�em, kim jeste�!";
};

func int DIA_Valentino_WhoAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //Pyta�em, kim jeste�!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Jestem Valentino Przystojniak. Lekkoduch i bawidamek.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Te wszystkie beztroskie, bogate kobiety wr�cz si� na mnie rzucaj�.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Swoje k�opoty zachowaj dla siebie, mnie one nie interesuj�.
};

// ********************************************************
// 						Manieren
// ********************************************************

instance DIA_Valentino_Manieren		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 3;
	condition	= DIA_Valentino_Manieren_Condition;
	information	= DIA_Valentino_Manieren_Info;
	permanent 	= FALSE;
	description	= "Wygl�da na to, �e to ciebie nale�a�oby nauczy� dobrych manier!";
};

func int DIA_Valentino_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //Wygl�da na to, �e to ciebie nale�a�oby nauczy� dobrych manier!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //F�r deine d�nnen �rmchen hast du 'ne ganz sch�n gro�e Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //Nic mnie to nie obchodzi! Mo�esz mi nawet da� w pysk, jutro wstan� �wie�y jak skowronek.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Ty za� b�dziesz si� w��czy� z t� szpetn� g�b� po kres swych dni.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnuetzliches
///////////////////////////////////////////////////////////////////////

var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;
//---------------------------------------------------

instance DIA_Valentino_WASNUETZLICHES		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 4;
	condition	= DIA_Valentino_WASNUETZLICHES_Condition;
	information	= DIA_Valentino_WASNUETZLICHES_Info;
	permanent	= TRUE;
	description	= "Masz jeszcze co� ciekawego do powiedzenia?";
};

func int DIA_Valentino_WASNUETZLICHES_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //Masz mo�e jeszcze co� ciekawego do powiedzenia?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was N�tzliches �ber die Stadt erz�hlen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Dbaj o popularno��, nigdy nic nikomu nie obiecuj, bierz, co daj� i uwa�aj, by nie popa�� w konflikt ze stra��.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //No... i z zazdrosnymi m�ami. Ci s� najgorsi, m�wi� ci.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //W przypadku kogo� takiego jak ty, mo�liwo�ci s� nieograniczone. Musisz umie� rozpozna� sytuacj� i wiedzie�, kiedy zacz�� dzia�a�.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Nie marnuj wi�c mojego czasu, bierz si� do roboty!
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //Powiedzia�em ci ju� wszystko, co powiniene� wiedzie� - reszta nale�y do ciebie.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Valentino_PICKPOCKET (C_INFO)
{
	npc			= VLK_421_Valentino;
	nr			= 900;
	condition	= DIA_Valentino_PICKPOCKET_Condition;
	information	= DIA_Valentino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};                       

FUNC INT DIA_Valentino_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Valentino) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Valentino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Valentino_PICKPOCKET);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_BACK 		,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Valentino, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Valentino_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Valentino_PICKPOCKET);
};




