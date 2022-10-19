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
	description	= "No proszê, co my tu mamy?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //No proszê, co my tu mamy?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Nazywam siê Valentino. Staram siê nie splamiæ prac¹ kolejnego dnia ofiarowanego mi przez Innosa.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //Uwa¿aj na s³owa.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Wybacz, Panie, nie mia³em nic z³ego na myœli.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //Czy nikt nie nauczy³ ciê manier? To oburzaj¹ce!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Ci¹gle tylko ta paplanina. Nie powinieneœ byæ teraz w pracy?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //Ale, z drugiej strony, któ¿by têskni³ za takim œmieciem, co?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //Gdybyœ mia³ tyle z³ota co ja, te¿ nie musia³byœ pracowaæ. Ty jednak nigdy nie bêdziesz tak bogaty.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Widzê, ¿e czeka mnie z tob¹ du¿o dobrej zabawy.
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
	description	= "Pyta³em, kim jesteœ!";
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
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //Pyta³em, kim jesteœ!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Jestem Valentino Przystojniak. Lekkoduch i bawidamek.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Te wszystkie beztroskie, bogate kobiety wrêcz siê na mnie rzucaj¹.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Swoje k³opoty zachowaj dla siebie, mnie one nie interesuj¹.
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
	description	= "Wygl¹da na to, ¿e to ciebie nale¿a³oby nauczyæ dobrych manier!";
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
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //Wygl¹da na to, ¿e to ciebie nale¿a³oby nauczyæ dobrych manier!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //Für deine dünnen Ärmchen hast du 'ne ganz schön große Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //Nic mnie to nie obchodzi! Mo¿esz mi nawet daæ w pysk, jutro wstanê œwie¿y jak skowronek.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Ty zaœ bêdziesz siê w³óczy³ z t¹ szpetn¹ gêb¹ po kres swych dni.
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
	description	= "Masz jeszcze coœ ciekawego do powiedzenia?";
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
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //Masz mo¿e jeszcze coœ ciekawego do powiedzenia?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was Nützliches über die Stadt erzählen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Dbaj o popularnoœæ, nigdy nic nikomu nie obiecuj, bierz, co daj¹ i uwa¿aj, by nie popaœæ w konflikt ze stra¿¹.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //No... i z zazdrosnymi mê¿ami. Ci s¹ najgorsi, mówiê ci.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //W przypadku kogoœ takiego jak ty, mo¿liwoœci s¹ nieograniczone. Musisz umieæ rozpoznaæ sytuacjê i wiedzieæ, kiedy zacz¹æ dzia³aæ.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Nie marnuj wiêc mojego czasu, bierz siê do roboty!
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //Powiedzia³em ci ju¿ wszystko, co powinieneœ wiedzieæ - reszta nale¿y do ciebie.
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
	description = "(Kradzie¿ tego klucza bêdzie doœæ ³atwa)";
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




