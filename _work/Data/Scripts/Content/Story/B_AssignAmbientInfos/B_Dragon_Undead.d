// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //I jak, koleś? Masz też oryginał?
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Exit(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 999;
	condition	= DIA_Dragon_Undead_Exit_Condition;
	information	= DIA_Dragon_Undead_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Undead_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Hello(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 5;
	condition	= DIA_Dragon_Undead_Hello_Condition;
	information	= DIA_Dragon_Undead_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Undead_Hello_Info()
{	
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //A więc udało ci się mnie odnaleźć. Bardzo długo czekałem na twoje przybycie.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Nie rozśmieszaj mnie. Zaraz mi powiesz, że wszystko przebiega zgodnie z twoim planem.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //Cóż ty możesz wiedzieć o moich zamiarach?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Czyż nie wysłałem Poszukiwaczy, by naprowadzili cię na mój ślad?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Czy nie pozostawiłem śladów mojego istnienia, tak wyraźnych, że trudno je było przeoczyć?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //Czy nie dostałeś się tutaj dzięki zbroi wykonanej ze smoczych jaj?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //Czy nawróceni paladyni nie byli wystarczającym powodem, byś poszukał sprawcy całego tego zamieszania?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Czy spotkanie z opętanymi nieszczęśnikami nie było wystarczającym powodem, byś poszukał sprawcy całego tego zamieszania?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Choćbyś nie wiem jak próbował, nie możesz temu zaprzeczyć.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Przeznaczenie tylko jednej sztuki nie zostało z góry określone! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Zabiłeś jednego z moich sług. To on miał posługiwać się Szponem...
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Sądzę, że ty go teraz masz. I za to zginiesz!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Dość tego.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kto wysłał cię na tę wojnę przeciw rodzajowi ludzkiemu?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Dlaczego tu przybyłeś?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kim jesteś?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Przeciwnikiem jest smok-ożywieniec. Muszę go zabić, zanim będę mógł opuścić tę przeklętą wyspę."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Kim jesteś?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //Nadal musisz o to pytać? Zastanów się, głupcze. Przecież wiesz, kim jestem.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Nie mam imienia. Tak jak ty nie masz imienia.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Mój stwórca obdarzył mnie boską mocą, tak jak twój bóg obdarzył mocą ciebie.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Moim przeznaczeniem jest zniszczyć świat.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Tak, jak twoje przeznaczenie wyznacza moralny kod paladynów.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Tak, jak ty sam niesiesz śmierć, łowco smoków.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Tak, jak twoim celem jest głoszenie wiary Innosa, Magu Ognia.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Czy nie czujesz więzi, która nas łączy? Tak! Już wiesz, kim jestem.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //Nie... To niemożliwe! Xardas zawsze mówił...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas jest słaby. Nie stanowi dla mnie żadnego zagrożenia. Tylko ty jesteś godzien stawić mi czoła.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //Tak zostało zapisane. Pora, byś pogodził się ze swoim przeznaczeniem.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Dlaczego tu przybyłeś?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //Powierzono mi mą moc, bym dzięki niej skąpał ten świat w morzu krwi.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Nie spocznę, póki ostatnia forteca praworządności nie obróci się w pył.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Kto wysłał cię na tę wojnę przeciw rodzajowi ludzkiemu?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Moim władcą jest Pan Ciemności. Znasz go. Słyszysz jego zew.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Moje armie powstaną wkrótce z jego imieniem na ustach, a świat spowije wieczny mrok.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Dość tego. Wyślę cię z powrotem do piekła, z którego wypełzłeś, gadzie.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //Nie jesteś jeszcze gotów do walki ze mną. Jeszcze chwila, a mój cel zostanie osiągnięty.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Naprawdę sądzisz, że możesz mi zaszkodzić tym szponem?
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Twoje szczątki pozwolą mi wyzwolić wiatr śmierci, który wkrótce omiecie cały świat.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





