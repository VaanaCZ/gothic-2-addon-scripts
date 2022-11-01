///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //Tak, ty slizký červe, opovážil ses přijít až před bránu samotného Pána!
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //To ty tady taháš za provázky?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Jsem strážcem Irdorathských síní, mocného zdroje Beliarovy síly na zemi. Božská Pánova moc pulzuje nyní mýma rukama.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Stačí mi jediné slovo k tomu, abych tě uvrhl do věčného šílenství.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Aha. Hádám, že se budu muset zbavit dalšího prostředníka.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Jsem u poslední brány. Klíčem k ní bude nejspíš černý mág."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Zaveď mě ke svému pánovi.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Kolik tobě podobných budu ještě muset zabít?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Co je tam za tím velkým portálem?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Kdo je tvůj pán?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Býval jsi Spáčovým následovníkem.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Kdo je tvůj pán?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Je to poutník mezi světy. Jeho božská moudrost nám přináší poznání.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Je Beliarovým vyvoleným, který zemi zbaví bídných Innosových následovníků.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Všem, kteří pochybují o jeho velkoleposti, přináší smrt.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //To zní povědomě.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Co je tam za tím velkým portálem?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(smích) Komnaty mého pána ti zůstanou zapovězeny. K otevření té brány ti neposkytnu žádnou příležitost.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //Býval jsi Spáčovým následovníkem.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //To už je dávno. Pán nám otevřel oči. Teď už nás nikdo nezastaví.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //Pán nám ukázal jedinou možnou cestu, jak se vypořádat s vámi nevěřícími.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Kolik tobě podobných budu ještě muset zabít?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Je nás hodně. Nemáš ani ponětí, kolik je těch, co čekali na tuto chvíli svobody.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Bědný křik se šíří celou zemí, když vstupujeme do tohoto světa.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Osvobodíme svět od barbarů, co si říkají strážci ohně. Naše shromáždění tady v chrámu už nebude trvat dlouho.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //Ano.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(teatrálně) Dost už těch blábolů! Zničím tě.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Tvůj zrak tě opustí a tvá duše zmizí v temnotách.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(pro sebe) Bez toho amuletu na vyvolávání duší to teď asi bude trochu problém.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



