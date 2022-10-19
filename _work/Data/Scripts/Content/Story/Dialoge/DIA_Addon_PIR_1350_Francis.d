// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs Hütte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt Hütte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "To twoja chata?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //To twoja chata?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //Nie, nale¿y do Grega.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich muß da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "Muszê siê dostaæ do chaty Grega.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Muszê siê dostaæ do chaty Grega.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //Nie ma mowy!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Grega nie ma, a ja zamkn¹³em drzwi, ¿eby nikt nie wpad³ na pomys³ zabrania sobie czegoœ. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Wiêc lepiej sp³ywaj, albo porachujê ci koœci.
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "Greg jest waszym szefem?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg jest waszym szefem?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //Te¿ mi coœ!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Ka¿dy ¿eglarz i ka¿dy szczur l¹dowy na tej wyspie s³ysza³ o straszliwym kapitanie Gregu!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //I w³aœnie on powierzy³ mi komendê nad reszt¹ ludzi!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //Mam zadbaæ, ¿eby ca³a ta banda nie rozpuœci³a siê do reszty pod jego nieobecnoœæ.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //Niektórzy myœl¹, ¿e mog¹ robiæ, co im siê ¿ywnie podoba, tylko dlatego ¿e kapitana Grega nie ma w pobli¿u.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //Ale siê zdziwi¹, kiedy Greg wróci. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Opowiem mu wszystko, s³yszysz?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //Tak¿e to, ¿e ktoœ próbowa³ myszkowaæ w jego chacie!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Odsuñ siê wiêc, albo popadniesz w nieliche k³opoty.
};
// ------------------------------------------------------------
// 		  			Gib mir Schlüssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "Daj mi klucz do chaty Grega!";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Daj mi klucz do chaty Grega!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //Chyba ¿artujesz!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Bêdê musia³ o tym pomyœleæ...", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "Co powiesz na 2000 sztuk z³ota?", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "Dam ci za to 1000 sztuk z³ota!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //Dam ci za to 1000 sztuk z³ota!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //To trochê ma³o, zwa¿ywszy, ¿e nak³aniasz mnie do zdrady mego kapitana!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Lepiej uwa¿aj, co mówisz, albo bêdê musia³ przetrzepaæ ci skórê!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //Co powiesz na 2000 sztuk z³ota?
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Ch³opcze, czy¿byœ chcia³ mnie nak³oniæ do zdrady?
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //Chocia¿ z drugiej strony...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //Czego siê boisz? Przecie¿ nikt siê nie dowie.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Dobra, oto klucz.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Tylko pospiesz siê, bo Greg mo¿e przyjœæ w ka¿dej chwili. I ani s³owa innym, jasne?
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //Nie masz przy sobie takiej sumy!
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "No to zobaczymy, co potrafisz. Stawaj!";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //No to zobaczymy, co potrafisz. Stawaj!
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //Co? Jestem tu kapitanem! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //Nauczê ciê szacunku, ty szczurze l¹dowy!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "Znalaz³em twoj¹ kryjówkê i skarb. To twój dziennik, prawda?";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //Znalaz³em twoj¹ kryjówkê i skarb. To twój dziennik, prawda?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Eeee... Nigdy wczeœniej go nie widzia³em...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //Hmm... Jeœli to nawet by³by mój dziennik...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //To chyba nie s¹dzisz, ¿e moi ch³opcy uwierz¹ ci tylko dlatego, ¿e masz przy sobie jakieœ po¿ó³k³e notatki?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Wykiwa³eœ ich przy podziale ³upu.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Ej... Poczekaj...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //Nie chcia³eœ przypadkiem klucza do chaty Grega?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Dam ci klucz do chaty kapitana!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //Tam jest naprawdê du¿o cennych przedmiotów...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //Ale teraz dawaj notatnik i trzymaj gêbê na k³ódkê. Umowa stoi?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //Tylko nie zrób czegoœ g³upiego!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Oto twoje 2000 sztuk z³ota!
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //I jeszcze 500, ¿ebyœ nie mówi³, ¿e na sk¹pca trafi³eœ.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Oto 500 sztuk z³ota!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //A teraz dawaj ten cholerny...
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(£atwo by³oby ukraœæ ten klucz)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft führt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //Przez ciebie Greg kaza³ mi pi³owaæ deski, a¿ nie wykorzystam do tego wszystkich drzew na ca³ej wyspie.
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //IdŸ sobie!
	AI_StopProcessInfos (self);
};


