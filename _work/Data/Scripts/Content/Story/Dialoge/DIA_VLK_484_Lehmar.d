///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lehmar_EXIT   (C_INFO)
{
	npc         = VLK_484_Lehmar;
	nr          = 999;
	condition   = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Entschuldigung
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_ENTSCHULDIGUNG		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  2;
	condition	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co s³ychaæ?";
};

func int DIA_Lehmar_ENTSCHULDIGUNG_Condition ()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_00"); //Co s³ychaæ?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_01"); //Ile chcesz?
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_02"); //Co masz na myœli?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_03"); //Zajmujê siê po¿yczkami. Skoro do mnie przychodzisz, to czego móg³byœ chcieæ? Oczywiœcie - pieniêdzy!
};

///////////////////////////////////////////////////////////////////////
//	Info GeldLeihen
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDLEIHEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_GELDLEIHEN_Condition;
	information	 = 	DIA_Lehmar_GELDLEIHEN_Info;
	permanent	 = 	TRUE;
	description	 = 	"Po¿ycz mi trochê pieniêdzy!";
};
//----------------------------------------
var int DIA_Lehmar_GELDLEIHEN_noPerm;
//----------------------------------------
func int DIA_Lehmar_GELDLEIHEN_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Lehmar_ENTSCHULDIGUNG))
	&&  (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_15_00"); //Po¿ycz mi trochê pieniêdzy!
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_09_01"); //Jasne. Ile chcesz? Pobieram 20 procent od po¿yczanej sumy.

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "Muszê siê zastanowiæ.", DIA_Lehmar_GELDLEIHEN_back );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "1000 sztuk z³ota.", DIA_Lehmar_GELDLEIHEN_1000 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, " 200 sztuk z³ota.", DIA_Lehmar_GELDLEIHEN_200 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "   50 sztuk z³ota.", DIA_Lehmar_GELDLEIHEN_50 );
	
	
};
func void DIA_Lehmar_GELDLEIHEN_back ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_back_15_00"); //Muszê siê zastanowiæ.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_back_09_01"); //Zdecyduj siê! Nie marnuj mojego czasu!

	AI_StopProcessInfos (self);
};

func void DIA_Lehmar_GELDLEIHEN_50 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_50_15_00"); //50 sztuk z³ota.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_50_09_01"); //Tak na próbê, co? Jutro chcê je z powrotem, jasne?

	CreateInvItems (self, ItMi_Gold, 50);
	B_GiveInvItems (self, other, ItMi_Gold, 50);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 50;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_200 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_200_15_00"); //200 sztuk z³ota.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_200_09_01"); //To sporo pieniêdzy. Jutro masz siê tutaj zjawiæ wraz z moim z³otem, jasne?
	

	CreateInvItems (self, ItMi_Gold, 200);
	B_GiveInvItems (self, other, ItMi_Gold, 200);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 200;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_1000 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_1000_15_00"); //1000 sztuk z³ota.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_01"); //Chyba nie masz zbyt równo pod sufitem?
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_02"); //Dam ci 100. I pamiêtaj, jutro chcê je z powrotem!
	

	CreateInvItems (self, ItMi_Gold, 100);
	B_GiveInvItems (self, other, ItMi_Gold, 100);


	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 100;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);
};

///////////////////////////////////////////////////////////////////////
//	Info warumGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_WARUMGELD		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_WARUMGELD_Condition;
	information	 = 	DIA_Lehmar_WARUMGELD_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy po¿yczasz pieni¹dze ka¿demu, kto o nie prosi?";
};

func int DIA_Lehmar_WARUMGELD_Condition ()
{
	if (Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_WARUMGELD_15_00"); //Czy po¿yczasz pieni¹dze ka¿demu, kto o nie prosi?
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_01"); //Spokojnie, wszyscy zwracaj¹ je na czas. Ty te¿ jutro tu przyjdziesz albo znajdê ciê i zabijê. Proste, prawda?
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_02"); //Masz tak charakterystyczn¹ facjatê, ¿e znalezienie ciê nie zajê³oby mi du¿o czasu.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_03"); //Wiêc niech ci siê nawet nie œni, ¿e móg³byœ mnie wykiwaæ.
};
///////////////////////////////////////////////////////////////////////
//	Info geldeintreiben
///////////////////////////////////////////////////////////////////////
var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  5;
	condition	 = 	DIA_Lehmar_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Lehmar_GELDEINTREIBEN_Condition ()
{
	if ((Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	&& (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_00"); //Ty draniu, oddawaj moje pieni¹dze! A poniewa¿ spóŸni³eœ siê ze sp³at¹, twój d³ug w³aœnie urós³.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_01"); //Zamiast standardowych 20 procent bêdziesz mi teraz musia³ oddaæ 30.


	Info_ClearChoices	(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Chcê sp³aciæ moje d³ugi.", DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen );
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Nic z tego, nie oddam ci ¿adnych pieniêdzy.", DIA_Lehmar_GELDEINTREIBEN_kannstmich );
};
func void DIA_Lehmar_GELDEINTREIBEN_kannstmich ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00"); //Nic z tego, nie oddam ci ¿adnych pieniêdzy.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01"); //O tak, zapewniam ciê, ¿e dasz.
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos (self);		
	
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00"); //Chcê sp³aciæ moje d³ugi.

				 	///////////////////////////////////////////////////////////////////////	
		 	
				 				 	if (Lehmar_GeldGeliehen == 50)
										{
											Lehmar_GeldGeliehen_MitZinsen = 65;	
										};
									if (Lehmar_GeldGeliehen == 200)
										{
											Lehmar_GeldGeliehen_MitZinsen = 260;	
										};
									if (Lehmar_GeldGeliehen == 100)
										{
											Lehmar_GeldGeliehen_MitZinsen = 130;	
										};
					///////////////////////////////////////////////////////////////////////						
										IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);


	if ((Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
	{
		B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
		
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01"); //Twoje szczêœcie! A teraz spadaj!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02"); //Nie masz wystarczaj¹co du¿o pieniêdzy! No dobrze, widzê, ¿e bêdê musia³ daæ ci nauczkê.
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03"); //Nie bierz tego do siebie. Po prostu muszê dbaæ o swoj¹ z³¹ reputacjê.
		Lehmar_vorbei = TRUE;
		
		AI_StopProcessInfos (self);		
		
		B_Attack (self, other, AR_NONE, 1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Geldzurück
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDZURUECK		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  6;
	condition	 = 	DIA_Lehmar_GELDZURUECK_Condition;
	information	 = 	DIA_Lehmar_GELDZURUECK_Info;
	permanent	 =  TRUE;
	description	 = 	"Oto twoje pieni¹dze!";
};
func int DIA_Lehmar_GELDZURUECK_Condition ()
{
	if 	(!(Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))
	&&  (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDZURUECK_15_00"); //Oto twoje pieni¹dze!

	if  (RangerHelp_LehmarKohle == TRUE)
	&& (Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_00"); //Nie zajmuj siê tym - Lares ju¿ rozwi¹za³ ten problem.
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_01"); //Ten osio³, z którym siê kumplujesz? To nie moja sprawa - mi³ego dnia ¿yczê.
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
					 	///////////////////////////////////////////////////////////////////////	
					 								 	
					 				 	if (Lehmar_GeldGeliehen == 50)
											{
												Lehmar_GeldGeliehen_MitZinsen = 60;	
											};
										if (Lehmar_GeldGeliehen == 200)
											{
												Lehmar_GeldGeliehen_MitZinsen = 240;	
											};
										if (Lehmar_GeldGeliehen == 100)
											{
												Lehmar_GeldGeliehen_MitZinsen = 120;	
											};
						///////////////////////////////////////////////////////////////////////						
											IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);
		
		if ( (Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
		{
			B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
				
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_01"); //Wspaniale! Interesy z tob¹ to czysta przyjemnoœæ.
				
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos (self);		
		}
		else
		{
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_02"); //Jesteœ kompletnie sp³ukany! Wróæ, kiedy ju¿ zdobêdziesz pieni¹dze. Termin jeszcze nie up³yn¹³. I pamiêtaj, 20 procent!
			AI_StopProcessInfos (self);		
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info NOCHMALGELD
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_NOCHMALGELD		(C_INFO)
{
	npc		 	 = 	VLK_484_Lehmar;
	nr			 =  8;
	condition	 = 	DIA_Lehmar_NOCHMALGELD_Condition;
	information	 = 	DIA_Lehmar_NOCHMALGELD_Info;
	permanent	 =	TRUE;	//Joly: letzte Info die im KAPITEL 1 Stehen bleibt
	description	 = 	"Czy móg³bym od ciebie po¿yczyæ trochê pieniêdzy?";
};
func int DIA_Lehmar_NOCHMALGELD_Condition ()
{
	if 	((Lehmar_GeldGeliehen == 0)
	&&  (Lehmar_GeldGeliehen_MitZinsen != 0)) //Joly: SC hat sich schon mal Geld geliehen!
	{
		return TRUE;
	};
};
func void DIA_Lehmar_NOCHMALGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_NOCHMALGELD_15_00"); //Czy móg³bym od ciebie po¿yczyæ trochê pieniêdzy?

	if (Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))//Joly: SC hat Schulden nicht ordnungsgemäß zurück gezahlt!
	|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_01"); //Czy masz mnie za g³upca? Spadaj st¹d!
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_02"); //Nic nie dostaniesz! Mia³em ostatnio spore wydatki i potrzebujê ka¿dej monety.
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_03"); //Wróæ za parê dni!
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lehmar_PICKPOCKET (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 900;
	condition	= DIA_Lehmar_PICKPOCKET_Condition;
	information	= DIA_Lehmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie¿ tej ma³ej ksi¹¿eczki bêdzie dziecinnie ³atwa)";
};                       

FUNC INT DIA_Lehmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Schuldenbuch) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_BACK 		,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItWr_Schuldenbuch, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  			Schuldenbuch weg
// ************************************************************

INSTANCE DIA_Lehmar_BuchWeg (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_BuchWeg_Condition;
	information	= DIA_Lehmar_BuchWeg_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lehmar_BuchWeg_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_BuchWeg_Info()
{	
	AI_Output (self, other, "DIA_Lehmar_Add_09_00"); //Jakiœ drañ ukrad³ moj¹ ksiêgê rachunkow¹...
	AI_Output (self, other, "DIA_Lehmar_Add_09_01"); //Nie mia³eœ z tym chyba nic wspólnego, prawda?
	AI_Output (other, self, "DIA_Addon_Lehmar_Add_15_02"); //Ja? Nie.
	AI_Output (self, other, "DIA_Lehmar_Add_09_03"); //Tak, tak, oczywiœcie. A teraz wynoœ siê st¹d.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  			Lehmar verhauen
// ************************************************************
INSTANCE DIA_Lehmar_verhauen (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_verhauen_Condition;
	information	= DIA_Lehmar_verhauen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lehmar_verhauen_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
		|| (Lehmar_vorbei == TRUE)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Lehmar_verhauen_Info()
{	
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};





