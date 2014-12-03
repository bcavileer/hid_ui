module HidUi
  class ApplicationController < ActionController::Base
    def index
      @identities = HidUi::Identity.where id_type: 'Example::Type'
      @misses     = HidCore.recorded 'Example::Type'
    end

    def identify
      if input
        identified_input= HidCore.identify input, 'Example::Type'
        if identified_input
          flash[:identify] = "Identified \"#{input}\" as \"#{identified_input}\"."
        else
          flash[:identify] = "Could not identify \"#{input}\"."
        end
      else
        flash[:identify] = "Please input something."
      end
      redirect_to root_path
    end

    def map
      if input && identity
        HidCore.map input, identity, 'Example::Type'
        flash[:map] = "Mapped \"#{input}\" to \"#{identity}\"."
      else
        flash[:clear] = "Please enter an identity."
      end
      redirect_to root_path
    end

    def delete
      HidUi::Identity.where(input: input, identity: identity, id_type: 'Example::Type').destroy_all
      flash[:delete] = "Deleted mapping \"#{input}\" to \"#{identity}\"."
      redirect_to root_path
    end

    def clear
      HidUi::Record.destroy_all
      flash[:clear] = 'Cleared all recorded misses.'
      redirect_to root_path
    end

    private

    def identity
      params[:identity].presence
    end

    def input
      params[:input].presence
    end
  end
end
