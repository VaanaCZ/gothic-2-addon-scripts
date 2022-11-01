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
	description	= "No proszę, co my tu mamy?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //No proszę, co my tu mamy?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Nazywam się Valentino. Staram się nie splamić pracą kolejnego dnia ofiarowanego mi przez Innosa.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //Uważaj na słowa.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Wybacz, Panie, nie miałem nic złego na myśli.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //Czy nikt nie nauczył cię manier? To oburzające!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Ciągle tylko ta paplanina. Nie powinieneś być teraz w pracy?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //Ale, z drugiej strony, któżby tęsknił za takim śmieciem, co?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //Gdybyś miał tyle złota co ja, też nie musiałbyś pracować. Ty jednak nigdy nie będziesz tak bogaty.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Widzę, że czeka mnie z tobą dużo dobrej zabawy.
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
	description	= "Pytałem, kim jesteś!";
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
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //Pytałem, kim jesteś!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Jestem Valentino Przystojniak. Lekkoduch i bawidamek.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Te wszystkie beztroskie, bogate kobiety wręcz się na mnie rzucają.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Swoje kłopoty zachowaj dla siebie, mnie one nie interesują.
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
	description	= "Wygląda na to, że to ciebie należałoby nauczyć dobrych manier!";
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
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //Wygląda na to, że to ciebie należałoby nauczyć dobrych manier!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //Für deine dünnen Ärmchen hast du 'ne ganz schön große Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //Nic mnie to nie obchodzi! Możesz mi nawet dać w pysk, jutro wstanę świeży jak skowronek.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Ty zaś będziesz się włóczył z tą szpetną gębą po kres swych dni.
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
	description	= "Masz jeszcze coś ciekawego do powiedzenia?";
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
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //Masz może jeszcze coś ciekawego do powiedzenia?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was Nützliches über die Stadt erzählen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Dbaj o popularność, nigdy nic nikomu nie obiecuj, bierz, co dają i uważaj, by nie popaść w konflikt ze strażą.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //No... i z zazdrosnymi mężami. Ci są najgorsi, mówię ci.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //W przypadku kogoś takiego jak ty, możliwości są nieograniczone. Musisz umieć rozpoznać sytuację i wiedzieć, kiedy zacząć działać.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Nie marnuj więc mojego czasu, bierz się do roboty!
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //Powiedziałem ci już wszystko, co powinieneś wiedzieć - reszta należy do ciebie.
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
	description = "(Kradzież tego klucza będzie dość łatwa)";
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




