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
	description	 = 	"Jak to jde?";
};

func int DIA_Lehmar_ENTSCHULDIGUNG_Condition ()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_00"); //Jak se vede?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_01"); //(otr·venÏ) Kolik chceö?
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_02"); //Co tÌm myslÌö, 'kolik'?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_03"); //Jsem lichv·¯. Co bys tak ode mÏ mohl chtÌt? PenÌze, samoz¯ejmÏ.
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
	description	 = 	"P˘jË mi nÏjakÈ penÌze!";
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
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_15_00"); //P˘jË mi nÏjakÈ penÌze!
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_09_01"); //JasnÏ! Kolik bys chtÏl? PoËÌt·m si 20 procent!

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "Budu o tom p¯em˝ölet.", DIA_Lehmar_GELDLEIHEN_back );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "1000 zlat˝ch.", DIA_Lehmar_GELDLEIHEN_1000 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, " 200 zlaù·k˘.", DIA_Lehmar_GELDLEIHEN_200 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "   50 zlaù·k˘.", DIA_Lehmar_GELDLEIHEN_50 );
	
	
};
func void DIA_Lehmar_GELDLEIHEN_back ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_back_15_00"); //Budu o tom p¯em˝ölet.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_back_09_01"); //Tak uû se rozhodni! Nepl˝tvej m˝m Ëasem!

	AI_StopProcessInfos (self);
};

func void DIA_Lehmar_GELDLEIHEN_50 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_50_15_00"); //50 zlat˝ch.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_50_09_01"); //Mal· ryba, co? Chci to zÌtra zp·tky, jasn˝?

	CreateInvItems (self, ItMi_Gold, 50);
	B_GiveInvItems (self, other, ItMi_Gold, 50);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 50;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_200 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_200_15_00"); //200 zlat˝ch.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_200_09_01"); //To je spousta penÏz. UvidÌm tÏ zase zÌtra a ty prachy taky, rozumÌme?
	

	CreateInvItems (self, ItMi_Gold, 200);
	B_GiveInvItems (self, other, ItMi_Gold, 200);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 200;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_1000 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_1000_15_00"); //1000 zlat˝ch.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_01"); //To se ti povolily vöechny örouby, nebo co?
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_02"); //D·m ti 100. A nezapomeÚ, zejtra to chci zp·tky!
	

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
	description	 = 	"To vûdycky rozhazujeö svoje penÌze takhle mezi lidi?";
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
	AI_Output (other, self, "DIA_Lehmar_WARUMGELD_15_00"); //To vûdycky rozhazujeö svoje penÌze takhle mezi lidi?
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_01"); //(pobavenÏ) Nestarej se. Vr·tÌö se. Jinak si tÏ najdu a zabiju. Je to tak jednoduchÈ.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_02"); //Ty m·ö tak osobitej ksicht, ûe mi nezabere moc Ëasu, abych si tÏ naöel.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_03"); //Takûe ani nepomysli na nÏjakou boudu.
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
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_00"); //M·ö zpoûdÏnÌ, ty bastarde! Dej sem moje prachy! A aû ti to budu muset zase p¯ipomÌnat, uû to bude mnohem draûöÌ.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_01"); //Bude tÏ to st·t 30 procent namÌsto tÏch 20.


	Info_ClearChoices	(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Tady je m˘j dluh.", DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen );
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "Ned·m ti nic.", DIA_Lehmar_GELDEINTREIBEN_kannstmich );
};
func void DIA_Lehmar_GELDEINTREIBEN_kannstmich ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00"); //Ned·m ti nic.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01"); //Ale ano, d·ö.
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos (self);		
	
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00"); //Tady je m˘j dluh.

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
		
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01"); //To m·ö ötÏstÌ! A teÔ se zdejchni!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02"); //Nem·ö u sebe dost penÏz! Dobr·, jak chceö. VidÌm, ûe bych ti mÏl d·t lekci.
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03"); //Neber si to nijak osobnÏ - musÌm si udrûovat svou povÏst.
		Lehmar_vorbei = TRUE;
		
		AI_StopProcessInfos (self);		
		
		B_Attack (self, other, AR_NONE, 1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Geldzur¸ck
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDZURUECK		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  6;
	condition	 = 	DIA_Lehmar_GELDZURUECK_Condition;
	information	 = 	DIA_Lehmar_GELDZURUECK_Info;
	permanent	 =  TRUE;
	description	 = 	"Tady jsou zp·tky tvoje penÌze!";
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
	AI_Output (other, self, "DIA_Lehmar_GELDZURUECK_15_00"); //Tady jsou zp·tky tvoje penÌze!

	if  (RangerHelp_LehmarKohle == TRUE)
	&& (Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_00"); //Bez obav, o to se postar· Lares.
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_01"); //Coûe? Ten hajzl je tv˘j kamar·d? No, vlastnÏ mi po tom nic nenÌ. Hezk˝ den.
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
				
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_01"); //V˝bornÏ! S tebou se dÏlaj obchody jedna radost.
				
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos (self);		
		}
		else
		{
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_02"); //Nem·ö dost penÏz! Vraù se, aû to budeö mÌt pohromadÏ. JeötÏ m·ö trochu Ëasu. Pamatuj, 20 procent!
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
	description	 = 	"M˘ûu si od tebe znovu p˘jËit?";
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
	AI_Output (other, self, "DIA_Lehmar_NOCHMALGELD_15_00"); //M˘ûu si od tebe p˘jËit nÏjakÈ dalöÌ penÌze?

	if (Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))//Joly: SC hat Schulden nicht ordnungsgem‰ﬂ zur¸ck gezahlt!
	|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_01"); //To si myslÌö, ûe jsem blbej? Vypadni!
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_02"); //TeÔ uû ne! MÏl jsem velkÈ v˝daje a pot¯ebuju kaûdou minci.
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_03"); //Vraù se za p·r dnÌ!
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
	description = "(Tuhle knÌûeËku by ukradlo i ment·lnÏ retardovanÈ dÌtÏ s umÏlou rukou.)";
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
	AI_Output (self, other, "DIA_Lehmar_Add_09_00"); //(zkrouöenÏ) NÏjakej mizernej kaps·¯ mi ölohnul moji ˙ËetnÌ knihu.
	AI_Output (self, other, "DIA_Lehmar_Add_09_01"); //Nem·ö s tÌm nic spoleËnÈho, ûe ne?
	AI_Output (other, self, "DIA_Addon_Lehmar_Add_15_02"); //(˙öklebek) J·? Ne.
	AI_Output (self, other, "DIA_Lehmar_Add_09_03"); //Ano, ano, dobr·. Tak uû bÏû.
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





